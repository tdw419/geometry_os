; DESCRIPTION: Draws a white rectangle at (402, 46) with width 75 and height 90.
; PLAN: r0=402(x), r1=46(y), r2=75(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 46
LDI r2, 75
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
