; DESCRIPTION: Renders a white box of size 75x119 starting at (172, 118).
; PLAN: r0=172(x), r1=118(y), r2=75(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 118
LDI r2, 75
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
