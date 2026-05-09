; DESCRIPTION: Draws a yellow rectangle at (302, 17) with width 65 and height 107.
; PLAN: r0=302(x), r1=17(y), r2=65(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 17
LDI r2, 65
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
