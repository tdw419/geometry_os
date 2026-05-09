; DESCRIPTION: Places a green 15x13 rectangle at position (222, 2).
; PLAN: r0=222(x), r1=2(y), r2=15(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 2
LDI r2, 15
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
