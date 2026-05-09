; DESCRIPTION: Renders a green box of size 74x112 starting at (93, 140).
; PLAN: r0=93(x), r1=140(y), r2=74(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 140
LDI r2, 74
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
