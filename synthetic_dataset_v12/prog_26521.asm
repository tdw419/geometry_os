; DESCRIPTION: Renders a green box of size 115x101 starting at (83, 138).
; PLAN: r0=83(x), r1=138(y), r2=115(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 138
LDI r2, 115
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
