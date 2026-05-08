; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters a loop where it performs operations such as shifting bits, comparing register values, drawing text, and dividing two numbers. The loop continuously updates the display frame until interrupted or terminated.

; input driven program
; initialization
  LDI r12, 255
  LDI r3, 0x9672EB
  LDI r20, 256
  LDI r2, 128
  LDI r0, 0x90D276
main_0:
  CMPI r11, r0, 2
  SHLI r1, r20, 3
  SHR r10, r25, r9
  LDI r13, 0xADA7EF
  LDI r10, 32
  LDI r15, 3705
  DRAWTEXT r13, r10, r15, "WORLD"
  DIV r13, r9, r8
  FRAME
  JMP main_0
