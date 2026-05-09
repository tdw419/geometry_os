; DESCRIPTION: Renders a green box of size 80x14 starting at (94, 100).
; PLAN: r0=94(x), r1=100(y), r2=80(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 100
LDI r2, 80
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
