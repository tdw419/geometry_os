; DESCRIPTION: Renders a green box of size 74x24 starting at (95, 118).
; PLAN: r0=95(x), r1=118(y), r2=74(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 118
LDI r2, 74
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
