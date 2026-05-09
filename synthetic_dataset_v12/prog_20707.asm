; DESCRIPTION: Draws a white rectangle at (2, 86) with width 75 and height 86.
; PLAN: r0=2(x), r1=86(y), r2=75(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 86
LDI r2, 75
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
