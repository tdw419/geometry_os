; DESCRIPTION: Places a green 13x94 box at position (254, 32).
; PLAN: r0=254(x), r1=32(y), r2=13(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 32
LDI r2, 13
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
