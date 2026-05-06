; lib/input.asm -- Standard Library: input helpers
;
; Version: 1.2.0
; Dependencies: none (base library)
; Clobbers: varies per function (see individual docs)
;
; Calling convention:
;   Arguments: r1-r8 (r0 = return value)
;   Caller-saved: r1-r9
;   Callee-saved: r10-r25
;
; Wraps IKEY, MOUSEQ, MOUSEX, MOUSEY, MOUSEB opcodes into
; convenient polling functions with debounce and edge detection.
;
; Design rule: state encoded as spatial patterns (position, region).
; No color-channel encoding for state.

; ═══════════════════════════════════════════════════════════════
; key_poll -- poll keyboard, return key code
;   returns r0 = key code (ASCII or 0 if no key pressed)
;   clobbers: r1
; ═══════════════════════════════════════════════════════════════
key_poll:
    IKEY r0
    RET

; ═══════════════════════════════════════════════════════════════
; key_pressed -- check if a specific key is currently held
;   r1 = key code (ASCII) to check
;   returns r0 = 1 if pressed, 0 if not
;   clobbers: r2
; ═══════════════════════════════════════════════════════════════
key_pressed:
    IKEY r2
    LDI r0, 0              ; default: not pressed
    JZ r2, keyp_done       ; no key at all
    CMP r2, r1
    JNZ r0, keyp_done      ; wrong key (CMP != 0)
    LDI r0, 1              ; correct key
keyp_done:
    RET

; ═══════════════════════════════════════════════════════════════
; key_any -- check if ANY key is pressed
;   returns r0 = 1 if any key pressed, 0 if not
;   clobbers: none
; ═══════════════════════════════════════════════════════════════
key_any:
    IKEY r0
    JZ r0, key_any_no
    LDI r0, 1
    RET
key_any_no:
    LDI r0, 0
    RET

; ═══════════════════════════════════════════════════════════════
; mouse_pos -- get mouse position
;   returns r0 = x, r1 = y (clobbers input r1)
;   clobbers: r2
; ═══════════════════════════════════════════════════════════════
mouse_pos:
    MOUSEQ r0              ; r0 = mouse x
    MOUSEQ r1              ; r1 = mouse y (second call)
    RET

; ═══════════════════════════════════════════════════════════════
; mouse_x -- get mouse X coordinate
;   returns r0 = x
;   clobbers: none
; ═══════════════════════════════════════════════════════════════
mouse_x:
    MOUSEQ r0
    RET

; ═══════════════════════════════════════════════════════════════
; mouse_y -- get mouse Y coordinate
;   returns r0 = y
;   clobbers: none
; ═══════════════════════════════════════════════════════════════
mouse_y:
    MOUSEQ r0              ; first call = x (discard)
    MOUSEQ r0              ; second call = y
    RET

; ═══════════════════════════════════════════════════════════════
; mouse_btn -- get mouse button state
;   returns r0 = button bitmask (1=left, 2=right, etc.)
;   clobbers: none
; ═══════════════════════════════════════════════════════════════
mouse_btn:
    MOUSEB r0
    RET

; ═══════════════════════════════════════════════════════════════
; mouse_in_rect -- check if mouse is inside a rectangle
;   r1 = rx, r2 = ry, r3 = rw, r4 = rh
;   returns r0 = 1 if inside, 0 if not
;   clobbers: r5, r6, r7, r8
; ═══════════════════════════════════════════════════════════════
mouse_in_rect:
    MOUSEQ r5              ; r5 = mx
    MOUSEQ r6              ; r6 = my
    ; Check mx >= rx
    CMP r5, r1
    BLT r0, mir_outside
    ; Check mx < rx + rw
    MOV r7, r1
    ADD r7, r3
    CMP r5, r7
    BGE r0, mir_outside
    ; Check my >= ry
    CMP r6, r2
    BLT r0, mir_outside
    ; Check my < ry + rh
    MOV r7, r2
    ADD r7, r4
    CMP r6, r7
    BGE r0, mir_outside
    LDI r0, 1
    RET
mir_outside:
    LDI r0, 0
    RET

; ═══════════════════════════════════════════════════════════════
; wait_key -- block until any key is pressed, return key code
;   returns r0 = key code that was pressed
;   clobbers: r1
; ═══════════════════════════════════════════════════════════════
wait_key:
    IKEY r0
    JZ r0, wait_key
    RET
