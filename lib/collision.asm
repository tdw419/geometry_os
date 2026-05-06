; lib/collision.asm -- Standard Library: collision detection primitives
;
; Version: 1.2.0
; Dependencies: none (base library)
; Clobbers: varies per function (see individual docs)
;
; Calling convention:
;   Arguments: r1-r8 (extended for multi-arg functions)
;   Return value: r0 (0 = false, 1 = true)
;   Caller-saved: r1-r9
;   Callee-saved: r10-r25 (ALL functions preserve these)
;   r0 is CMP result register -- always save/restore when needed
;   r30 = SP, r31 = return PC
;
; All functions use register-only arguments (no RAM).
; Squared distance used throughout to avoid SQRT.

; ═══════════════════════════════════════════════════════════════
; rect_overlap -- AABB rectangle overlap test
;   r1 = x1, r2 = y1, r3 = w1, r4 = h1
;   r5 = x2, r6 = y2, r7 = w2, r8 = h2
;   returns r0 = 1 if rectangles overlap, 0 if not
;   clobbers: r9
;
;   Overlap condition (all must be true):
;     x1 < x2 + w2  AND  x1 + w1 > x2
;     y1 < y2 + h2  AND  y1 + h1 > y2
; ═══════════════════════════════════════════════════════════════
rect_overlap:
    ; Check: x1 < x2 + w2  (if NOT, no overlap)
    MOV r9, r5
    ADD r9, r7             ; r9 = x2 + w2
    CMP r1, r9
    BGE r0, ro_no_overlap  ; x1 >= x2+w2 -> no overlap

    ; Check: x2 < x1 + w1  (equivalent to x1+w1 > x2; if NOT, no overlap)
    MOV r9, r1
    ADD r9, r3             ; r9 = x1 + w1
    CMP r5, r9
    BGE r0, ro_no_overlap  ; x2 >= x1+w1 -> no overlap

    ; Check: y1 < y2 + h2  (if NOT, no overlap)
    MOV r9, r6
    ADD r9, r8             ; r9 = y2 + h2
    CMP r2, r9
    BGE r0, ro_no_overlap  ; y1 >= y2+h2 -> no overlap

    ; Check: y2 < y1 + h1  (equivalent to y1+h1 > y2; if NOT, no overlap)
    MOV r9, r2
    ADD r9, r4             ; r9 = y1 + h1
    CMP r6, r9
    BGE r0, ro_no_overlap  ; y2 >= y1+h1 -> no overlap

    ; All checks passed -- overlap
    LDI r0, 1
    RET

ro_no_overlap:
    LDI r0, 0
    RET

; ═══════════════════════════════════════════════════════════════
; point_in_rect -- test if a point is inside a rectangle
;   r1 = px, r2 = py
;   r3 = rx, r4 = ry, r5 = rw, r6 = rh
;   returns r0 = 1 if point is inside rect, 0 if not
;   clobbers: r7
;
;   Inside condition:
;     px >= rx  AND  px < rx + rw
;     py >= ry  AND  py < ry + rh
; ═══════════════════════════════════════════════════════════════
point_in_rect:
    ; Check: px >= rx
    CMP r1, r3
    BLT r0, pir_outside    ; px < rx -> outside

    ; Check: px < rx + rw
    MOV r7, r3
    ADD r7, r5             ; r7 = rx + rw
    CMP r1, r7
    BGE r0, pir_outside    ; px >= rx+rw -> outside

    ; Check: py >= ry
    CMP r2, r4
    BLT r0, pir_outside    ; py < ry -> outside

    ; Check: py < ry + rh
    MOV r7, r4
    ADD r7, r6             ; r7 = ry + rh
    CMP r2, r7
    BGE r0, pir_outside    ; py >= ry+rh -> outside

    ; All checks passed -- inside
    LDI r0, 1
    RET

pir_outside:
    LDI r0, 0
    RET

; ═══════════════════════════════════════════════════════════════
; point_in_circle -- test if a point is inside a circle
;   r1 = px, r2 = py, r3 = cx, r4 = cy, r5 = cr
;   returns r0 = 1 if point is inside circle, 0 if not
;   clobbers: r8, r9
;
;   Uses squared distance: (px-cx)^2 + (py-cy)^2 <= cr^2
;   v1.2.0: Restructured to use only caller-saved registers
; ═══════════════════════════════════════════════════════════════
point_in_circle:
    ; dx = px - cx
    MOV r8, r1
    SUB r8, r3             ; r8 = dx
    MUL r8, r8             ; r8 = dx^2

    ; dy = py - cy
    MOV r9, r2
    SUB r9, r4             ; r9 = dy
    MUL r9, r9             ; r9 = dy^2

    ; dist_sq = dx^2 + dy^2
    ADD r8, r9             ; r8 = dist_sq

    ; cr_sq = cr * cr
    MOV r9, r5
    MUL r9, r9             ; r9 = cr_sq

    ; Check: dist_sq <= cr_sq
    CMP r8, r9
    LDI r9, 1
    CMP r0, r9             ; if CMP >= 1 (dist_sq > cr_sq), outside
    JZ r0, pic_outside

    LDI r0, 1
    RET

pic_outside:
    LDI r0, 0
    RET

; ═══════════════════════════════════════════════════════════════
; circle_rect_intersect -- test if a circle intersects a rectangle
;   r1 = cx, r2 = cy, r3 = cr
;   r4 = rx, r5 = ry, r6 = rw, r7 = rh
;   returns r0 = 1 if intersect, 0 if not
;   clobbers: r4, r5, r6, r7, r8, r9
;
;   Algorithm: find closest point on rect to circle center,
;   then check if distance to that point <= cr.
;   Uses squared distance (no SQRT needed).
;
;   closest_x = clamp(cx, rx, rx+rw)
;   closest_y = clamp(cy, ry, ry+rh)
;   dist_sq = (cx - closest_x)^2 + (cy - closest_y)^2
;   return dist_sq <= cr^2
;
;   v1.2.0: Restructured to use only caller-saved registers
; ═══════════════════════════════════════════════════════════════
circle_rect_intersect:
    ; Precompute rect edges (clobber r8, r9 -- these are caller-saved)
    MOV r8, r4
    ADD r8, r6             ; r8 = rx + rw (right edge)
    MOV r9, r5
    ADD r9, r7             ; r9 = ry + rh (bottom edge)

    ; --- Clamp cx to [rx, rx+rw] -> store in r4 ---
    CMP r1, r4             ; CMP(cx, rx)
    LDI r7, 0xFFFFFFFF     ; temp for CMP check (clobbering rh, no longer needed)
    CMP r0, r7
    JZ r0, cri_cx_lo       ; cx < rx
    CMP r1, r8             ; CMP(cx, rx+rw)
    LDI r7, 1
    CMP r0, r7
    JZ r0, cri_cx_hi       ; cx > rx+rw
    ; cx in range: closest_x = cx
    MOV r4, r1
    JMP cri_cy_clamp

cri_cx_lo:
    ; closest_x = rx (r4 already = rx)
    JMP cri_cy_clamp

cri_cx_hi:
    ; closest_x = rx + rw
    MOV r4, r8

cri_cy_clamp:
    ; r4 = closest_x, r8 = rx+rw, r9 = ry+rh
    ; --- Clamp cy to [ry, ry+rh] -> store in r5 ---
    ; r5 = ry (still intact from original input)
    CMP r2, r5             ; CMP(cy, ry)
    LDI r7, 0xFFFFFFFF
    CMP r0, r7
    JZ r0, cri_cy_lo       ; cy < ry
    CMP r2, r9             ; CMP(cy, ry+rh)
    LDI r7, 1
    CMP r0, r7
    JZ r0, cri_cy_hi       ; cy > ry+rh
    ; cy in range: closest_y = cy
    MOV r5, r2
    JMP cri_dist

cri_cy_lo:
    ; closest_y = ry (r5 already = ry)
    JMP cri_dist

cri_cy_hi:
    ; closest_y = ry + rh
    MOV r5, r9

cri_dist:
    ; r4 = closest_x, r5 = closest_y
    ; r1 = cx, r2 = cy, r3 = cr (all intact)
    ; dx = cx - closest_x
    MOV r6, r1
    SUB r6, r4             ; r6 = dx
    MUL r6, r6             ; r6 = dx^2
    ; dy = cy - closest_y
    MOV r7, r2
    SUB r7, r5             ; r7 = dy
    MUL r7, r7             ; r7 = dy^2
    ; dist_sq = dx^2 + dy^2
    ADD r6, r7             ; r6 = dist_sq
    ; cr_sq = cr * cr
    MOV r7, r3
    MUL r7, r7             ; r7 = cr^2
    ; Check: dist_sq <= cr_sq
    CMP r6, r7
    LDI r7, 1
    CMP r0, r7             ; if CMP >= 1 (dist_sq > cr_sq), no intersect
    JZ r0, cri_no_intersect

    LDI r0, 1
    RET

cri_no_intersect:
    LDI r0, 0
    RET

; ═══════════════════════════════════════════════════════════════
; circles_overlap -- test if two circles overlap or touch
;   r1 = cx1, r2 = cy1, r3 = r1 (radius 1)
;   r4 = cx2, r5 = cy2, r6 = r2 (radius 2)
;   returns r0 = 1 if overlap or touch, 0 if not
;   clobbers: r8, r9
;
;   Uses squared distance: dist_sq <= (r1+r2)^2
;   v1.2.0: Restructured to use only caller-saved registers
; ═══════════════════════════════════════════════════════════════
circles_overlap:
    ; dx = cx2 - cx1
    MOV r8, r4
    SUB r8, r1             ; r8 = dx
    MUL r8, r8             ; r8 = dx^2

    ; dy = cy2 - cy1
    MOV r9, r5
    SUB r9, r2             ; r9 = dy
    MUL r9, r9             ; r9 = dy^2

    ; dist_sq = dx^2 + dy^2
    ADD r8, r9             ; r8 = dist_sq

    ; sum_r = r1 + r2, then square
    MOV r9, r3
    ADD r9, r6             ; r9 = r1 + r2
    MUL r9, r9             ; r9 = (r1 + r2)^2

    ; Check: dist_sq <= (r1+r2)^2
    CMP r8, r9
    LDI r9, 1
    CMP r0, r9             ; if CMP >= 1 (dist_sq > sum_r_sq), no overlap
    JZ r0, co_no_overlap

    LDI r0, 1
    RET

co_no_overlap:
    LDI r0, 0
    RET

; ═══════════════════════════════════════════════════════════════
; point_in_triangle -- test if a point is inside a triangle
;   r1 = px, r2 = py
;   r3 = x1, r4 = y1, r5 = x2, r6 = y2, r7 = x3, r8 = y3
;   returns r0 = 1 if inside, 0 if not
;   clobbers: r1-r9 (uses PUSH/POP to preserve r10-r15)
;
;   Uses barycentric coordinate method (all integer math):
;   Compute cross products of edge vectors with point vectors.
;   If all three have the same sign, point is inside.
;
;   d1 = sign((x2-x1)*(py-y1) - (y2-y1)*(px-x1))
;   d2 = sign((x3-x2)*(py-y2) - (y3-y2)*(px-x2))
;   d3 = sign((x1-x3)*(py-y3) - (y1-y3)*(px-x3))
;   has_neg = (d1 < 0) or (d2 < 0) or (d3 < 0)
;   has_pos = (d1 > 0) or (d2 > 0) or (d3 > 0)
;   inside = NOT (has_neg AND has_pos)
;
;   v1.2.0: Uses PUSH/POP to properly preserve callee-saved r10-r15
; ═══════════════════════════════════════════════════════════════
point_in_triangle:
    PUSH r10
    PUSH r11
    PUSH r12
    PUSH r13
    PUSH r14
    PUSH r15

    ; --- Compute d1 ---
    ; edge_x = x2 - x1
    MOV r9, r5
    SUB r9, r3             ; r9 = edge_x
    ; point_y_off = py - y1
    MOV r10, r2
    SUB r10, r4            ; r10 = point_y_off
    MUL r9, r10            ; r9 = edge_x * point_y_off

    ; edge_y = y2 - y1
    MOV r10, r6
    SUB r10, r4            ; r10 = edge_y
    ; point_x_off = px - x1
    MOV r11, r1
    SUB r11, r3            ; r11 = point_x_off
    MUL r10, r11           ; r10 = edge_y * point_x_off

    SUB r9, r10            ; r9 = d1

    ; --- Compute d2 ---
    ; edge_x = x3 - x2
    MOV r10, r7
    SUB r10, r5            ; r10 = edge_x
    ; point_y_off = py - y2
    MOV r11, r2
    SUB r11, r6            ; r11 = point_y_off
    MUL r10, r11           ; r10 = edge_x * point_y_off

    ; edge_y = y3 - y2
    MOV r11, r8
    SUB r11, r6            ; r11 = edge_y
    ; point_x_off = px - x2
    MOV r12, r1
    SUB r12, r5            ; r12 = point_x_off
    MUL r11, r12           ; r11 = edge_y * point_x_off

    SUB r10, r11           ; r10 = d2

    ; --- Compute d3 ---
    ; edge_x = x1 - x3
    MOV r11, r3
    SUB r11, r7            ; r11 = edge_x
    ; point_y_off = py - y3
    MOV r12, r2
    SUB r12, r8            ; r12 = point_y_off
    MUL r11, r12           ; r11 = edge_x * point_y_off

    ; edge_y = y1 - y3
    MOV r12, r4
    SUB r12, r8            ; r12 = edge_y
    ; point_x_off = px - x3
    MOV r13, r1
    SUB r13, r7            ; r13 = point_x_off
    MUL r12, r13           ; r12 = edge_y * point_x_off

    SUB r11, r12           ; r11 = d3

    ; --- Check signs ---
    ; has_neg: any of d1, d2, d3 have bit 31 set (negative)
    LDI r12, 0x80000000
    MOV r13, r9
    AND r13, r12           ; d1 sign bit
    MOV r14, r10
    AND r14, r12           ; d2 sign bit
    OR r13, r14
    MOV r14, r11
    AND r14, r12           ; d3 sign bit
    OR r13, r14            ; r13 = has_neg (nonzero if any negative)

    ; has_pos: any of d1, d2, d3 are nonzero and don't have bit 31 set
    ; Check: if d1 > 0 (nonzero and bit 31 clear)
    LDI r14, 0
    CMP r9, r14
    LDI r15, 1
    CMP r0, r15            ; d1 > 0?
    JZ r0, pit_d1_pos
    LDI r14, 0xFFFFFFFF
    CMP r0, r14            ; d1 < 0?
    JZ r0, pit_d1_neg
    JMP pit_d1_zero

pit_d1_pos:
    LDI r14, 1
    JMP pit_check_d2

pit_d1_neg:
    LDI r14, 0
    JMP pit_check_d2

pit_d1_zero:
    LDI r14, 0

pit_check_d2:
    ; r14 accumulates has_pos (1 if any d_i > 0)
    LDI r15, 0
    CMP r10, r15
    LDI r15, 1
    CMP r0, r15            ; d2 > 0?
    JZ r0, pit_d2_pos
    LDI r15, 0xFFFFFFFF
    CMP r0, r15            ; d2 < 0?
    JZ r0, pit_d2_neg
    JMP pit_check_d3

pit_d2_pos:
    LDI r14, 1
    JMP pit_check_d3

pit_d2_neg:
    JMP pit_check_d3

pit_check_d3:
    LDI r15, 0
    CMP r11, r15
    LDI r15, 1
    CMP r0, r15            ; d3 > 0?
    JZ r0, pit_d3_pos
    JMP pit_sign_done

pit_d3_pos:
    LDI r14, 1

pit_sign_done:
    ; r13 = has_neg (nonzero if any negative)
    ; r14 = has_pos (1 if any positive)
    ; inside = NOT (has_neg AND has_pos)
    JZ r13, pit_inside     ; no negatives -> all non-negative
    JZ r14, pit_inside     ; no positives -> all non-positive
    ; Both has_neg and has_pos -> mixed signs -> outside
    POP r15
    POP r14
    POP r13
    POP r12
    POP r11
    POP r10
    LDI r0, 0
    RET

pit_inside:
    POP r15
    POP r14
    POP r13
    POP r12
    POP r11
    POP r10
    LDI r0, 1
    RET
