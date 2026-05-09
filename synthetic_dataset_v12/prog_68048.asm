; DESCRIPTION: Draws a white rectangle at (162, 119) with width 112 and height 32.
; PLAN: r0=162(x), r1=119(y), r2=112(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 119
LDI r2, 112
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
