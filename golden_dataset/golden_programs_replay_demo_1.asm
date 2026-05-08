; DESCRIPTION: A colored object centered at the screen with fixed size.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r4, 1         ; mode = start recording
  SNAP_TRACE r4      ; begin trace recording

  LDI r10, 0         ; frame counter
  LDI r3, 16        ; total frames to draw
  LDI r13, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r6, 0
  FILL r6

  ; Draw a vertical bar at position r13
  LDI r14, 0          ; y = 0
  LDI r15, 256        ; y limit
  LDI r0, 0x00FF00   ; green bar color
  LDI r11, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r13, r14)
  LDI r9, 0
bar_x:
  LDI r8, 0
  ADD r8, r13
  ADD r8, r9         ; x = bar_pos + offset
  SCREENP r8, r14, r0    ; set pixel
  LDI r12, 1
  ADD r9, r12
  CMP r9, r11
  BLT r1, bar_x

  LDI r12, 1
  ADD r14, r12
  CMP r14, r15
  BLT r1, bar_y

  ; Advance bar position
  LDI r12, 16
  ADD r13, r12

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r12, 1
  ADD r10, r12
  CMP r10, r3
  BLT r1, draw_loop

  ; Stop recording
  LDI r4, 0
  SNAP_TRACE r4

  ; Now replay backward: show frames from newest to oldest
  LDI r5, 0         ; replay index (0 = newest)

replay_loop:
  LDI r4, 0
  ADD r4, r5        ; frame index to replay
  REPLAY r4

  ; Small delay between replay frames
  LDI r2, 0
delay:
  LDI r7, 1
  ADD r2, r7
  CMP r2, r3       ; short delay
  BLT r1, delay

  LDI r12, 1
  ADD r5, r12
  CMP r5, r3       ; replay all 16 frames
  BLT r1, replay_loop

  HALT
