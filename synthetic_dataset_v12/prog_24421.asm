; DESCRIPTION: Draws a blue rectangle at (302, 110) with width 98 and height 65.
; PLAN: r0=302(x), r1=110(y), r2=98(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 110
LDI r2, 98
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
