; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r6, 1         ; mode = start recording
  SNAP_TRACE r6      ; begin trace recording

  LDI r12, 0         ; frame counter
  LDI r2, 16        ; total frames to draw
  LDI r8, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r11, 0
  FILL r11

  ; Draw a vertical bar at position r8
  LDI r9, 0          ; y = 0
  LDI r4, 256        ; y limit
  LDI r13, 0x00FF00   ; green bar color
  LDI r3, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r8, r9)
  LDI r10, 0
bar_x:
  LDI r1, 0
  ADD r1, r8
  ADD r1, r10         ; x = bar_pos + offset
  SCREENP r1, r9, r13    ; set pixel
  LDI r14, 1
  ADD r10, r14
  CMP r10, r3
  BLT r0, bar_x

  LDI r14, 1
  ADD r9, r14
  CMP r9, r4
  BLT r0, bar_y

  ; Advance bar position
  LDI r14, 16
  ADD r8, r14

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r14, 1
  ADD r12, r14
  CMP r12, r2
  BLT r0, draw_loop

  ; Stop recording
  LDI r6, 0
  SNAP_TRACE r6

  ; Now replay backward: show frames from newest to oldest
  LDI r15, 0         ; replay index (0 = newest)

replay_loop:
  LDI r6, 0
  ADD r6, r15        ; frame index to replay
  REPLAY r6

  ; Small delay between replay frames
  LDI r7, 0
delay:
  LDI r5, 1
  ADD r7, r5
  CMP r7, r2       ; short delay
  BLT r0, delay

  LDI r14, 1
  ADD r15, r14
  CMP r15, r2       ; replay all 16 frames
  BLT r0, replay_loop

  HALT
