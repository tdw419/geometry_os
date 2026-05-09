; DESCRIPTION: Draws a green rectangle at (75, 175) with width 78 and height 44.
; PLAN: r0=75(x), r1=175(y), r2=78(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 175
LDI r2, 78
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
