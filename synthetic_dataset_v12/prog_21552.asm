; DESCRIPTION: Renders a yellow box of size 31x52 starting at (61, 118).
; PLAN: r0=61(x), r1=118(y), r2=31(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 118
LDI r2, 31
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
