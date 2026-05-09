; DESCRIPTION: Draws a white rectangle at (280, 90) with width 75 and height 15.
; PLAN: r0=280(x), r1=90(y), r2=75(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 90
LDI r2, 75
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
