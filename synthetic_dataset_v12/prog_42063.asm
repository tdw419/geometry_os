; DESCRIPTION: Renders a purple box of size 60x34 starting at (73, 155).
; PLAN: r0=73(x), r1=155(y), r2=60(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 155
LDI r2, 60
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
