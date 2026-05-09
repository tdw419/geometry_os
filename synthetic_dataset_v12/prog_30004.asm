; DESCRIPTION: Renders a yellow box of size 56x118 starting at (115, 14).
; PLAN: r0=115(x), r1=14(y), r2=56(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 14
LDI r2, 56
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
