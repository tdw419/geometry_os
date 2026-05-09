; DESCRIPTION: Renders a green box of size 98x118 starting at (15, 62).
; PLAN: r0=15(x), r1=62(y), r2=98(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 62
LDI r2, 98
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
