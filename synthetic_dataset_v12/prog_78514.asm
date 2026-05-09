; DESCRIPTION: Places a green 105x84 rectangle at position (147, 76).
; PLAN: r0=147(x), r1=76(y), r2=105(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 76
LDI r2, 105
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
