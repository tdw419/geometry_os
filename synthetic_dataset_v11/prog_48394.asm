; DESCRIPTION: Draws a yellow rectangle at (32, 52) with width 108 and height 107.
; PLAN: r0=32(x), r1=52(y), r2=108(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 52
LDI r2, 108
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
