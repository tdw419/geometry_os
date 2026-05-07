; DESCRIPTION: This GeOS assembly code initializes registers and repeatedly displays the text "WORLD" at a specific coordinate while manipulating other registers for graphical operations. It includes logical operations like XOR and OR, and arithmetic operations such as multiplication, within an infinite loop.

; input driven program
; initialization
  LDI r5, 0
  LDI r11, 16
  LDI r9, 4
  LDI r6, 1205
  LDI r4, 4
  LDI r7, 16
main_0:
  LDI r6, 0
  LDI r4, 2420
  LDI r11, 255
  DRAWTEXT r6, r4, r11, "WORLD"
  XOR r15, r10, r5
  LDI r8, 0x6FF8A2
  FILL r8
  OR r14, r10, r1
  XOR r14, r13, r1
  MUL r12, r14, r8
  FRAME
  JMP main_0
