; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r15, 1
LDI r5, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r11, 0

y_loop:
  LDI r14, 0

  x_loop:
    MOV r12, r14
    AND r12, r11
    JNZ r12, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r9, r11
    JNZ r9, not_top
    LDI r9, 0xFF0000
    JMP have_color
    not_top:
    MOV r9, r14
    JNZ r9, not_left
    LDI r9, 0xFFFF00
    JMP have_color
    not_left:
    LDI r9, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r7, 80
    STORE r5, r7
    ADD r5, r15
    LDI r7, 83
    STORE r5, r7
    ADD r5, r15
    LDI r7, 69
    STORE r5, r7
    ADD r5, r15
    LDI r7, 84
    STORE r5, r7
    ADD r5, r15
    LDI r7, 73
    STORE r5, r7
    ADD r5, r15
    LDI r7, 32
    STORE r5, r7
    ADD r5, r15

    ; X coord = x * 32 as decimal
    MOV r7, r14
    LDI r16, 32
    MUL r7, r16
    CALL write_dec

    LDI r7, 44
    STORE r5, r7
    ADD r5, r15

    ; Y coord = y * 32 as decimal
    MOV r7, r11
    LDI r16, 32
    MUL r7, r16
    CALL write_dec

    LDI r7, 44
    STORE r5, r7
    ADD r5, r15

    ; Color as hex "0xHHHHHH"
    LDI r7, 48
    STORE r5, r7
    ADD r5, r15
    LDI r7, 120
    STORE r5, r7
    ADD r5, r15

    ; Write 6 hex nibbles from r9
    PUSH r31
    PUSH r9
    PUSH r4
    LDI r4, 20
    hex_loop:
      MOV r7, r9
      MOV r16, r4
      SHR r7, r16
      LDI r16, 15
      AND r7, r16
      LDI r16, 10
      CMP r7, r16
      BGE r0, hex_alpha
      LDI r16, 48
      ADD r7, r16
      JMP hex_write
      hex_alpha:
      LDI r16, 55
      ADD r7, r16
      hex_write:
      STORE r5, r7
      ADD r5, r15
      LDI r7, 4
      SUB r4, r7
      LDI r7, 31
      MOV r16, r4
      SAR r16, r7
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r4
    POP r9
    POP r31

    LDI r7, 10
    STORE r5, r7
    ADD r5, r15

    skip_pixel:
    ADD r14, r15
    LDI r7, 8
    CMP r14, r7
    BLT r0, x_loop

  ADD r11, r15
  LDI r7, 8
  CMP r11, r7
  BLT r0, y_loop

; Write HALT
LDI r7, 72
STORE r5, r7
ADD r5, r15
LDI r7, 65
STORE r5, r7
ADD r5, r15
LDI r7, 76
STORE r5, r7
ADD r5, r15
LDI r7, 84
STORE r5, r7
ADD r5, r15
LDI r7, 0
STORE r5, r7

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r7 = number (0-255)
;       r5 = canvas position (advances)
;       r15 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r7, wd_nonzero
  LDI r7, 48
  STORE r5, r7
  ADD r5, r15
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r7
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r5, r17
  ADD r5, r15
  MOV r17, r7
  DIV r17, r16
  MUL r17, r16
  SUB r7, r17
  wd_tens:
  LDI r16, 10
  MOV r17, r7
  DIV r17, r16
  LDI r18, 48
  ADD r17, r18
  STORE r5, r17
  ADD r5, r15
  MOV r17, r7
  DIV r17, r16
  MUL r17, r16
  SUB r7, r17
  LDI r16, 48
  ADD r7, r16
  STORE r5, r7
  ADD r5, r15
  wd_done:
  POP r31
  RET
