; DESCRIPTION: Draws a yellow rectangle at (86, 147) with width 91 and height 35.
; PLAN: r0=86(x), r1=147(y), r2=91(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 147
LDI r2, 91
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
