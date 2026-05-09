; DESCRIPTION: Renders a green box of size 80x98 starting at (78, 106).
; PLAN: r0=78(x), r1=106(y), r2=80(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 106
LDI r2, 80
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
