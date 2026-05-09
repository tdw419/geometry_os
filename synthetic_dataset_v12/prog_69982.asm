; DESCRIPTION: Draws a green rectangle at (106, 54) with width 120 and height 91.
; PLAN: r0=106(x), r1=54(y), r2=120(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 54
LDI r2, 120
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
