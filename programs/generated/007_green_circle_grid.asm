; 4x4 grid of green circles evenly spaced across 256x256 screen
; Spacing: 256/5 = ~51 pixels apart, starting at x=32, y=32

LDI r0, 0x00FF00       ; green color
LDI r7, 15             ; radius

; Row loop: r1 = y position
LDI r1, 32
LDI r8, 4              ; row count

row_loop:
  LDI r2, 32            ; r2 = x position
  LDI r9, 4             ; col count

  col_loop:
    CIRCLE r2, r1, r7, r0

    ; x += 51
    LDI r3, 51
    ADD r2, r3

    ; col_count--
    LDI r3, 1
    SUB r9, r3
    JNZ r9, col_loop

  ; y += 51
  LDI r3, 51
  ADD r1, r3

  ; reset col count
  LDI r9, 4

  ; row_count--
  LDI r3, 1
  SUB r8, r3
  JNZ r8, row_loop

HALT
