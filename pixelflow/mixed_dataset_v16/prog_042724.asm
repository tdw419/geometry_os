; DESCRIPTION: Draws a white rectangle at (70, 49) with width 25 and height 75.
; PLAN: r0=70(x), r1=49(y), r2=25(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 49
LDI r2, 25
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
