; DESCRIPTION: Draws a white rectangle at (145, 65) with width 85 and height 117.
; PLAN: r0=145(x), r1=65(y), r2=85(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 65
LDI r2, 85
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
