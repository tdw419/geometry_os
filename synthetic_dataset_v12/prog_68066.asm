; DESCRIPTION: Draws a green rectangle at (251, 55) with width 65 and height 71.
; PLAN: r0=251(x), r1=55(y), r2=65(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 55
LDI r2, 65
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
