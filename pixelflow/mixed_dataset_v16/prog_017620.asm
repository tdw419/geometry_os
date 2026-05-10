; DESCRIPTION: Draws a white rectangle at (112, 134) with width 28 and height 115.
; PLAN: r0=112(x), r1=134(y), r2=28(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 134
LDI r2, 28
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
