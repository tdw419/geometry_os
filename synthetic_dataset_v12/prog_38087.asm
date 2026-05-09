; DESCRIPTION: Draws a white rectangle at (382, 77) with width 13 and height 112.
; PLAN: r0=382(x), r1=77(y), r2=13(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 77
LDI r2, 13
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
