; DESCRIPTION: Renders a purple box of size 39x54 starting at (93, 66).
; PLAN: r0=93(x), r1=66(y), r2=39(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 66
LDI r2, 39
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
