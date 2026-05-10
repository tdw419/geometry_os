; DESCRIPTION: Renders a purple box of size 120x106 starting at (292, 136).
; PLAN: r0=292(x), r1=136(y), r2=120(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 136
LDI r2, 120
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
