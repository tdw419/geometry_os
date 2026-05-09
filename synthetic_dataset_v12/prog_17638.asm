; DESCRIPTION: Renders a green box of size 88x106 starting at (292, 24).
; PLAN: r0=292(x), r1=24(y), r2=88(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 24
LDI r2, 88
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
