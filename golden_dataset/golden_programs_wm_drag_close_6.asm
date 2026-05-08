; DESCRIPTION: This GeOS assembly code implements a window manager that controls three windows on the screen. It supports dragging windows by clicking and holding the title bar, closing windows by clicking the close button in the top-right corner of the title bar, and re-tiling the remaining windows after one is closed. The system uses various registers to track window states, handle mouse and keyboard inputs, and manage drawing operations.

; wm_drag_close.asm -- Window Manager with drag, close, and re-tiling (Phase 95)
;
; A window manager process that owns the full screen, tracks rectangular regions
; for each window, handles mouse drag on title bars, supports close buttons,
; and re-tiles remaining windows after close.
;
; Uses WINSYS (create/destroy/hittest/moveto/winfo), MOUSEQ, and WPIXEL.
;
; Controls:
;   Mouse move + click title bar = drag window
;   Click close button (red X, top-right of title bar) = close window
;   Press Q to quit
;
; ── Register Layout ──────────────────────────────────────────────
;   r12  = constant 1
;   r20 = constant 0
;   r7-r1 = window IDs (0 if closed)
;   r13 = dragging window id (0 = none)
;   r16 = drag offset X
;   r17 = drag offset Y
;   r18 = animation counter
;   r21-r23 = mouse mx, my, btn (from MOUSEQ)
;   r24 = keyboard key (from IKEY)
;   r25-r29 = scratch
; ──────────────────────────────────────────────────────────────────

; ── Constants ──
LDI r12, 1
LDI r20, 0
LDI r30, 0xFF00

; ── Store title strings in RAM ──
LDI r5, 0x2000
STRO r5, "Draw"
LDI r5, 0x2020
STRO r5, "Status"
LDI r5, 0x2040
STRO r5, "Colors"

; ── Create 3 windows ──

; Window 1 "Draw" at (16, 16), 100x80
LDI r6, 16
LDI r2, 16
LDI r3, 100
LDI r15, 80
LDI r10, 0x2000
LDI r5, 0
WINSYS r5
MOV r7, r8

; Window 2 "Status" at (136, 16), 100x80
LDI r6, 136
LDI r2, 16
LDI r3, 100
LDI r15, 80
LDI r10, 0x2020
LDI r5, 0
WINSYS r5
MOV r0, r8

; Window 3 "Colors" at (76, 110), 100x80
LDI r6, 76
LDI r2, 110
LDI r3, 100
LDI r15, 80
LDI r10, 0x2040
LDI r5, 0
WINSYS r5
MOV r1, r8

; ── Draw initial window contents ──
CALL draw_win1_content
CALL draw_win2_content
CALL draw_win3_content

; ── Drag state ──
LDI r13, 0
LDI r16, 0
LDI r17, 0
LDI r18, 0

; ══════════════════════════════════════════════════════════════════
; ── Main Loop ──
; ══════════════════════════════════════════════════════════════════
main_loop:
  FILL r20          ; clear screen to black

  ; Read mouse state
  MOUSEQ r21        ; r21=mx, r22=my, r23=btn

  ; Read keyboard
  IKEY r24
  LDI r25, 81       ; 'Q'
  CMP r24, r25
  JZ r8, quit

  ; ── Handle mouse click ──
  LDI r25, 2
  CMP r23, r25      ; btn == 2 (click)?
  BGE r8, check_drag

  ; Fresh click -- do hittest
  LDI r5, 4         ; op=4 (hittest)
  WINSYS r5         ; r8=win_id, r6=hit_type

  ; If no hit, skip
  JZ r8, no_click_action

  ; Bring clicked window to front
  LDI r5, 2         ; op=2 (bring to front)
  WINSYS r5

  ; Save hit window id for later
  MOV r28, r8       ; r28 = hit_win_id

  ; ── Get window info for close button check ──
  LDI r6, 0x9000    ; winfo dest addr
  LDI r5, 6         ; op=6 (winfo)
  WINSYS r5

  ; Read window x, y, w from winfo output
  LDI r25, 0x9000
  LOAD r25, r25     ; r25 = win_x
  LDI r26, 0x9001
  LOAD r26, r26     ; r26 = win_y
  LDI r27, 0x9002
  LOAD r27, r27     ; r27 = win_w

  ; close_x = win_x + win_w - 12
  MOV r29, r25
  ADD r29, r27
  LDI r5, 12
  SUB r29, r5       ; r29 = close_x

  ; Check if mouse is in close button area:
  ;   mx >= close_x AND mx < close_x + 10 AND my >= win_y AND my < win_y + 12

  ; Check mx >= close_x
  CMP r21, r29
  BLT r8, start_drag_check    ; mx < close_x, not on close button

  ; Check mx < close_x + 10
  MOV r5, r29
  LDI r25, 10
  ADD r5, r25       ; r5 = close_x + 10
  CMP r21, r5
  BGE r8, start_drag_check    ; mx >= close_x + 10, not on close button

  ; Check my >= win_y AND my < win_y + 12
  ; (r26 = win_y, already loaded)
  CMP r22, r26
  BLT r8, start_drag_check    ; my < win_y
  LDI r25, 12
  ADD r25, r26       ; win_y + 12
  CMP r22, r25
  BGE r8, start_drag_check    ; my >= win_y + 12

  ; ── Close button clicked! Destroy the window ──
  MOV r8, r28       ; restore hit window id
  LDI r5, 1         ; op=1 (destroy)
  WINSYS r5

  ; Clear the window id from our tracking
  CMP r7, r28
  JZ r8, closed_w1
  CMP r0, r28
  JZ r8, closed_w2
  LDI r1, 0
  JMP do_retile

closed_w1:
  LDI r7, 0
  JMP do_retile

closed_w2:
  LDI r0, 0

do_retile:
  CALL retile_windows
  JMP no_click_action

  ; ── Start drag (title bar hit, not close button) ──
start_drag_check:
  ; Re-do hittest for hit_type (r6 was overwritten by winfo)
  LDI r5, 4
  WINSYS r5          ; r8=win_id, r6=hit_type

  ; Check hit type -- title bar (1) = start drag
  LDI r25, 1
  CMP r6, r25
  JNZ r8, no_click_action

  ; Start dragging
  MOV r13, r8

  ; Get window info for drag offset
  LDI r6, 0x9000
  LDI r5, 6
  WINSYS r5

  ; drag_ox = mouse_x - win_x
  LDI r25, 0x9000
  LOAD r25, r25      ; win_x
  MOV r26, r21
  SUB r26, r25
  MOV r16, r26

  ; drag_oy = mouse_y - win_y
  LDI r25, 0x9001
  LOAD r25, r25      ; win_y
  MOV r26, r22
  SUB r26, r25
  MOV r17, r26

  JMP no_click_action

check_drag:
  ; If not dragging, skip
  JZ r13, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r8, r13       ; win_id
  MOV r6, r21
  SUB r6, r16       ; new_x = mx - drag_ox
  MOV r2, r22
  SUB r2, r17       ; new_y = my - drag_oy
  LDI r5, 5         ; op=5 (moveto)
  WINSYS r5

  JMP no_click_action

stop_drag:
  LDI r13, 0
  JMP no_click_action

no_click_action:

  ; ── Update animation counter (throttled) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 7
  AND r26, r27
  JNZ r26, skip_update
  ADD r18, r12
  CALL draw_win2_content
  CALL draw_win3_content
skip_update:

  ; ── Draw all window frames ──
  JZ r7, skip_frame1
  MOV r8, r7
  CALL draw_window_frame
skip_frame1:

  JZ r0, skip_frame2
  MOV r8, r0
  CALL draw_window_frame
skip_frame2:

  JZ r1, skip_frame3
  MOV r8, r1
  CALL draw_window_frame
skip_frame3:

  FRAME
  JMP main_loop

quit:
  HALT

; ══════════════════════════════════════════════════════════════════
; ── Re-tile remaining windows ──
; ══════════════════════════════════════════════════════════════════
retile_windows:
  PUSH r31
  PUSH r8
  PUSH r6
  PUSH r2
  PUSH r3
  PUSH r15
  PUSH r10
  PUSH r5

  ; Count active windows
  LDI r3, 0
  JZ r7, ret_cnt2
  ADD r3, r12
ret_cnt2:
  JZ r0, ret_cnt3
  ADD r3, r12
ret_cnt3:
  JZ r1, ret_done_cnt
  ADD r3, r12
ret_done_cnt:

  ; If 0 windows, nothing to tile
  JZ r3, retile_done

  ; Compute tile width = 240 / count
  LDI r15, 240
  DIV r15, r3        ; r15 = tile_width
  LDI r25, 8
  MOV r10, r25       ; r10 = current_x (start at 8)

  ; Tile window 1
  JZ r7, retile_w2
  MOV r8, r7
  MOV r6, r10
  LDI r2, 16
  LDI r5, 5
  WINSYS r5
  ADD r10, r15
retile_w2:

  ; Tile window 2
  JZ r0, retile_w3
  MOV r8, r0
  MOV r6, r10
  LDI r2, 16
  LDI r5, 5
  WINSYS r5
  ADD r10, r15
retile_w3:

  ; Tile window 3
  JZ r1, retile_done
  MOV r8, r1
  MOV r6, r10
  LDI r2, 16
  LDI r5, 5
  WINSYS r5

retile_done:
  POP r5
  POP r10
  POP r15
  POP r3
  POP r2
  POP r6
  POP r8
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Draw Window Frame (title bar + border + close button) ──
; r8 = win_id
; ══════════════════════════════════════════════════════════════════
draw_window_frame:
  PUSH r31
  PUSH r8
  PUSH r6
  PUSH r2
  PUSH r3
  PUSH r15
  PUSH r10
  PUSH r5

  ; Get window info
  LDI r6, 0x9000
  LDI r5, 6         ; WINFO
  WINSYS r5
  JZ r8, frame_done  ; window not found

  ; Read winfo output
  LDI r25, 0x9000
  LOAD r2, r25      ; win_x
  LDI r25, 0x9001
  LOAD r3, r25      ; win_y
  LDI r25, 0x9002
  LOAD r15, r25      ; win_w
  LDI r25, 0x9003
  LOAD r10, r25      ; win_h

  ; ── Title bar (12px tall, dark purple) ──
  LDI r6, 0x444488
  MOV r5, r3         ; y = win_y
title_y:
  MOV r8, r2         ; x = win_x
title_x:
  PSET r8, r5, r6
  ADD r8, r12
  MOV r25, r2
  ADD r25, r15        ; x limit
  CMP r8, r25
  BLT r8, title_x
  ADD r5, r12
  LDI r25, 12
  ADD r25, r3        ; y limit (win_y + 12)
  CMP r5, r25
  BLT r8, title_y

  ; ── Close button (red 8x8 at top-right of title bar) ──
  ; Position: x = win_x + win_w - 11, y = win_y + 2
  MOV r25, r2
  ADD r25, r15
  LDI r26, 11
  SUB r25, r26       ; close_x = win_x + win_w - 11
  LDI r26, 2
  ADD r26, r3        ; close_y = win_y + 2

  LDI r6, 0xCC2222   ; red
  MOV r27, r26       ; y counter
close_y:
  MOV r8, r25        ; x counter
close_x:
  PSET r8, r27, r6
  ADD r8, r12
  MOV r28, r25
  LDI r29, 8
  ADD r28, r29
  CMP r8, r28
  BLT r8, close_x
  ADD r27, r12
  MOV r28, r26
  LDI r29, 8
  ADD r28, r29
  CMP r27, r28
  BLT r8, close_y

  ; ── Border outline (gray) ──
  LDI r6, 0x888888
  ; Left + right edges
  MOV r8, r3         ; y = win_y
border_y:
  PSET r2, r8, r6    ; left edge
  MOV r25, r2
  ADD r25, r15
  SUB r25, r12        ; right edge x
  PSET r25, r8, r6
  ADD r8, r12
  MOV r25, r3
  ADD r25, r10
  CMP r8, r25
  BLT r8, border_y

  ; Bottom edge
  MOV r8, r3
  ADD r8, r10
  SUB r8, r12         ; bottom y
  MOV r5, r2         ; x = win_x
bottom_x:
  PSET r5, r8, r6
  ADD r5, r12
  MOV r25, r2
  ADD r25, r15
  CMP r5, r25
  BLT r8, bottom_x

frame_done:
  POP r5
  POP r10
  POP r15
  POP r3
  POP r2
  POP r6
  POP r8
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 1 Content: Green background with H pattern ──
; ══════════════════════════════════════════════════════════════════
draw_win1_content:
  PUSH r31
  PUSH r8

  MOV r8, r7       ; win_id
  JZ r8, dw1_done

  ; Fill with dark green
  LDI r3, 0x003300
  LDI r15, 0
fill1_loop:
  LDI r5, 0
fill1_x:
  WPIXEL r8, r5, r15, r3
  ADD r5, r12
  LDI r25, 100
  CMP r5, r25
  BLT r8, fill1_x
  ADD r15, r12
  LDI r25, 80
  CMP r15, r25
  BLT r8, fill1_loop

  ; Draw a bright green H
  LDI r3, 0x00FF00
  LDI r15, 30
  LDI r5, 40
h_left:
  WPIXEL r8, r5, r15, r3
  ADD r15, r12
  LDI r25, 60
  CMP r15, r25
  BLT r8, h_left

  LDI r15, 30
  LDI r5, 50
h_right:
  WPIXEL r8, r5, r15, r3
  ADD r15, r12
  LDI r25, 60
  CMP r15, r25
  BLT r8, h_right

  LDI r15, 44
  LDI r5, 40
h_bar:
  WPIXEL r8, r5, r15, r3
  ADD r5, r12
  LDI r25, 51
  CMP r5, r25
  BLT r8, h_bar

dw1_done:
  POP r8
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 2 Content: Blue background with counter bar ──
; ══════════════════════════════════════════════════════════════════
draw_win2_content:
  PUSH r31
  PUSH r8

  MOV r8, r0       ; win_id
  JZ r8, dw2_done

  ; Fill with dark blue
  LDI r3, 0x000044
  LDI r15, 0
fill2_loop:
  LDI r5, 0
fill2_x:
  WPIXEL r8, r5, r15, r3
  ADD r5, r12
  LDI r25, 100
  CMP r5, r25
  BLT r8, fill2_x
  ADD r15, r12
  LDI r25, 80
  CMP r15, r25
  BLT r8, fill2_loop

  ; Draw counter bar
  LDI r3, 0xFFFFFF
  LDI r15, 40
  MOV r10, r18
  LDI r25, 90
  MOD r10, r25
  ADD r10, r12
  LDI r5, 5
bar_loop:
  CMP r5, r10
  BGE r8, bar_done
  WPIXEL r8, r5, r15, r3
  ADD r5, r12
  JMP bar_loop
bar_done:

dw2_done:
  POP r8
  POP r31
  RET

; ══════════════════════════════════════════════════════════════════
; ── Window 3 Content: Animated color stripes ──
; ══════════════════════════════════════════════════════════════════
draw_win3_content:
  PUSH r31
  PUSH r8
  PUSH r6
  PUSH r2

  MOV r8, r1       ; win_id
  JZ r8, dw3_done

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r15, 0
stripe_y:
  LDI r5, 0
stripe_x:
  MOV r6, r5
  ADD r6, r26
  LDI r25, 31
  AND r6, r25
  LDI r25, 3
  MUL r6, r25
  LDI r25, 8
  SHL r6, r25
  MOV r3, r15
  LDI r2, 7
  AND r3, r2
  LDI r25, 16
  SHL r3, r25
  OR r6, r3
  MOV r3, r6

  WPIXEL r8, r5, r15, r3
  ADD r5, r12
  LDI r25, 100
  CMP r5, r25
  BLT r8, stripe_x

  ADD r15, r12
  LDI r25, 80
  CMP r15, r25
  BLT r8, stripe_y

dw3_done:
  POP r2
  POP r6
  POP r8
  POP r31
  RET
