; DESCRIPTION: Draws a white rectangle at (249, 79) with width 118 and height 20.
; PLAN: r0=249(x), r1=79(y), r2=118(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 79
LDI r2, 118
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
