; DESCRIPTION: Draws a green rectangle at (68, 172) with width 120 and height 75.
; PLAN: r0=68(x), r1=172(y), r2=120(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 172
LDI r2, 120
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
