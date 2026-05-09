; DESCRIPTION: Draws a white rectangle at (47, 2) with width 112 and height 49.
; PLAN: r0=47(x), r1=2(y), r2=112(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 2
LDI r2, 112
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
