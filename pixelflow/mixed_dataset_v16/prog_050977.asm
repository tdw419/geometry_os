; DESCRIPTION: Renders a white box of size 110x93 starting at (311, 34).
; PLAN: r0=311(x), r1=34(y), r2=110(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 34
LDI r2, 110
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
