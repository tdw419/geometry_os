; DESCRIPTION: Renders a white box of size 118x28 starting at (345, 45).
; PLAN: r0=345(x), r1=45(y), r2=118(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 45
LDI r2, 118
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
