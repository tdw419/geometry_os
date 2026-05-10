; DESCRIPTION: Renders a white box of size 81x119 starting at (112, 35).
; PLAN: r0=112(x), r1=35(y), r2=81(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 35
LDI r2, 81
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
