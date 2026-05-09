; DESCRIPTION: Renders a white box of size 118x31 starting at (134, 65).
; PLAN: r0=134(x), r1=65(y), r2=118(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 65
LDI r2, 118
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
