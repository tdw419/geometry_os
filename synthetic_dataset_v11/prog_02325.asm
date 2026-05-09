; DESCRIPTION: Draws a yellow rectangle at (89, 89) with width 32 and height 37.
; PLAN: r0=89(x), r1=89(y), r2=32(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 89
LDI r2, 32
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
