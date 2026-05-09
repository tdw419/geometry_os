; DESCRIPTION: Renders a white box of size 10x73 starting at (311, 161).
; PLAN: r0=311(x), r1=161(y), r2=10(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 161
LDI r2, 10
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
