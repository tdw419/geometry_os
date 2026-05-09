; DESCRIPTION: Draws a white rectangle at (64, 125) with width 106 and height 56.
; PLAN: r0=64(x), r1=125(y), r2=106(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 125
LDI r2, 106
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
