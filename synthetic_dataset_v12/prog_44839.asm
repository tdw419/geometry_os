; DESCRIPTION: Renders a purple box of size 51x39 starting at (62, 90).
; PLAN: r0=62(x), r1=90(y), r2=51(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 90
LDI r2, 51
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
