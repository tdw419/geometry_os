; DESCRIPTION: Renders a white box of size 66x94 starting at (18, 85).
; PLAN: r0=18(x), r1=85(y), r2=66(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 85
LDI r2, 66
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
