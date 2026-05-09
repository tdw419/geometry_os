; DESCRIPTION: Renders a yellow box of size 115x93 starting at (260, 26).
; PLAN: r0=260(x), r1=26(y), r2=115(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 26
LDI r2, 115
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
