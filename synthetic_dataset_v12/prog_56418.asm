; DESCRIPTION: Renders a purple box of size 115x119 starting at (183, 59).
; PLAN: r0=183(x), r1=59(y), r2=115(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 59
LDI r2, 115
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
