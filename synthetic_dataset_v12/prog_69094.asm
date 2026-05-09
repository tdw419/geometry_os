; DESCRIPTION: Draws a green rectangle at (110, 102) with width 98 and height 40.
; PLAN: r0=110(x), r1=102(y), r2=98(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 102
LDI r2, 98
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
