; DESCRIPTION: Draws a white rectangle at (5, 134) with width 92 and height 97.
; PLAN: r0=5(x), r1=134(y), r2=92(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 134
LDI r2, 92
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
