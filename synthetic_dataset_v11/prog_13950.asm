; DESCRIPTION: Renders a green box of size 101x89 starting at (34, 80).
; PLAN: r0=34(x), r1=80(y), r2=101(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 80
LDI r2, 101
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
