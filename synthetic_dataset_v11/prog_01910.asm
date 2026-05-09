; DESCRIPTION: Renders a green box of size 66x118 starting at (113, 90).
; PLAN: r0=113(x), r1=90(y), r2=66(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 90
LDI r2, 66
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
