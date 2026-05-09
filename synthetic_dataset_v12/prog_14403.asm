; DESCRIPTION: Renders a purple box of size 66x35 starting at (292, 153).
; PLAN: r0=292(x), r1=153(y), r2=66(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 153
LDI r2, 66
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
