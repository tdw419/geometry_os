; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and enters an infinite loop (`main_0`) where it draws the text "WORLD" at a fixed position on the screen using the `DRAWTEXT` instruction. The loop continuously updates certain registers through bitwise operations and then calls `FRAME` to refresh the display, before jumping back to the start of the loop.

; drawing loop program
; initialization
  LDI r13, 0xC0F515
  LDI r2, 0xB447FF
  LDI r11, 64
  LDI r9, 1908
  LDI r1, 0x1AB3F9
  LDI r12, 4
main_0:
  LDI r6, 10
  LDI r20, 0x63B17D
  LDI r2, 0x689901
  DRAWTEXT r6, r20, r2, "WORLD"
  OR r0, r8, r2
  AND r4, r27, r7
  AND r7, r3, r14
  FRAME
  JMP main_0
