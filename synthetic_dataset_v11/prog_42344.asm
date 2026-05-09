; DESCRIPTION: Renders a white box of size 35x101 starting at (115, 20).
; PLAN: r0=115(x), r1=20(y), r2=35(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 20
LDI r2, 35
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
