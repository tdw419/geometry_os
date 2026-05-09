; DESCRIPTION: Renders a green box of size 118x22 starting at (93, 37).
; PLAN: r0=93(x), r1=37(y), r2=118(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 37
LDI r2, 118
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
