; DESCRIPTION: A colored object centered at the screen with fixed size.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r7, 1
LDI r8, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r13, 0

y_loop:
  LDI r0, 0

  x_loop:
    MOV r4, r0
    AND r4, r13
    JNZ r4, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r10, r13
    JNZ r10, not_top
    LDI r10, 0xFF0000
    JMP have_color
    not_top:
    MOV r10, r0
    JNZ r10, not_left
    LDI r10, 0xFFFF00
    JMP have_color
    not_left:
    LDI r10, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r5, 80
    STORE r8, r5
    ADD r8, r7
    LDI r5, 83
    STORE r8, r5
    ADD r8, r7
    LDI r5, 69
    STORE r8, r5
    ADD r8, r7
    LDI r5, 84
    STORE r8, r5
    ADD r8, r7
    LDI r5, 73
    STORE r8, r5
    ADD r8, r7
    LDI r5, 32
    STORE r8, r5
    ADD r8, r7

    ; X coord = x * 32 as decimal
    MOV r5, r0
    LDI r16, 32
    MUL r5, r16
    CALL write_dec

    LDI r5, 44
    STORE r8, r5
    ADD r8, r7

    ; Y coord = y * 32 as decimal
    MOV r5, r13
    LDI r16, 32
    MUL r5, r16
    CALL write_dec

    LDI r5, 44
    STORE r8, r5
    ADD r8, r7

    ; Color as hex "0xHHHHHH"
    LDI r5, 48
    STORE r8, r5
    ADD r8, r7
    LDI r5, 120
    STORE r8, r5
    ADD r8, r7

    ; Write 6 hex nibbles from r10
    PUSH r31
    PUSH r10
    PUSH r3
    LDI r3, 20
    hex_loop:
      MOV r5, r10
      MOV r16, r3
      SHR r5, r16
      LDI r16, 15
      AND r5, r16
      LDI r16, 10
      CMP r5, r16
      BGE r1, hex_alpha
      LDI r16, 48
      ADD r5, r16
      JMP hex_write
      hex_alpha:
      LDI r16, 55
      ADD r5, r16
      hex_write:
      STORE r8, r5
      ADD r8, r7
      LDI r5, 4
      SUB r3, r5
      LDI r5, 31
      MOV r16, r3
      SAR r16, r5
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r3
    POP r10
    POP r31

    LDI r5, 10
    STORE r8, r5
    ADD r8, r7

    skip_pixel:
    ADD r0, r7
    LDI r5, 8
    CMP r0, r5
    BLT r1, x_loop

  ADD r13, r7
  LDI r5, 8
  CMP r13, r5
  BLT r1, y_loop

; Write HALT
LDI r5, 72
STORE r8, r5
ADD r8, r7
LDI r5, 65
STORE r8, r5
ADD r8, r7
LDI r5, 76
STORE r8, r5
ADD r8, r7
LDI r5, 84
STORE r8, r5
ADD r8, r7
LDI r5, 0
STORE r8, r5

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r5 = number (0-255)
;       r8 = canvas position (advances)
;       r7 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r5, wd_nonzero
  LDI r5, 48
  STORE r8, r5
  ADD r8, r7
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r5
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r8, r17
  ADD r8, r7
  MOV r17, r5
  DIV r17, r16
  MUL r17, r16
  SUB r5, r17
  wd_tens:
  LDI r16, 10
  MOV r17, r5
  DIV r17, r16
  LDI r18, 48
  ADD r17, r18
  STORE r8, r17
  ADD r8, r7
  MOV r17, r5
  DIV r17, r16
  MUL r17, r16
  SUB r5, r17
  LDI r16, 48
  ADD r5, r16
  STORE r8, r5
  ADD r8, r7
  wd_done:
  POP r31
  RET
