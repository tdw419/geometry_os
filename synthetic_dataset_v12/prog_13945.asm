; DESCRIPTION: Draws a white rectangle at (80, 18) with width 37 and height 105.
; PLAN: r0=80(x), r1=18(y), r2=37(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 18
LDI r2, 37
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
