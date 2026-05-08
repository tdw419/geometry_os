; DESCRIPTION: This GeOS assembly code records and displays a vertical color bar moving across the screen for 16 frames, then replays those frames backward using the REPLAY opcode. The code utilizes SNAP_TRACE to start and stop recording, FRAME to checkpoint each frame during drawing, and SCREENP to draw pixels on the screen.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r5, 1         ; mode = start recording
  SNAP_TRACE r5      ; begin trace recording

  LDI r10, 0         ; frame counter
  LDI r9, 16        ; total frames to draw
  LDI r1, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r11, 0
  FILL r11

  ; Draw a vertical bar at position r1
  LDI r12, 0          ; y = 0
  LDI r8, 256        ; y limit
  LDI r7, 0x00FF00   ; green bar color
  LDI r0, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r1, r12)
  LDI r14, 0
bar_x:
  LDI r13, 0
  ADD r13, r1
  ADD r13, r14         ; x = bar_pos + offset
  SCREENP r13, r12, r7    ; set pixel
  LDI r4, 1
  ADD r14, r4
  CMP r14, r0
  BLT r2, bar_x

  LDI r4, 1
  ADD r12, r4
  CMP r12, r8
  BLT r2, bar_y

  ; Advance bar position
  LDI r4, 16
  ADD r1, r4

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r4, 1
  ADD r10, r4
  CMP r10, r9
  BLT r2, draw_loop

  ; Stop recording
  LDI r5, 0
  SNAP_TRACE r5

  ; Now replay backward: show frames from newest to oldest
  LDI r3, 0         ; replay index (0 = newest)

replay_loop:
  LDI r5, 0
  ADD r5, r3        ; frame index to replay
  REPLAY r5

  ; Small delay between replay frames
  LDI r15, 0
delay:
  LDI r6, 1
  ADD r15, r6
  CMP r15, r9       ; short delay
  BLT r2, delay

  LDI r4, 1
  ADD r3, r4
  CMP r3, r9       ; replay all 16 frames
  BLT r2, replay_loop

  HALT
