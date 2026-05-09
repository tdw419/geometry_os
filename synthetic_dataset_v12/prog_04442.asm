; DESCRIPTION: Renders a purple box of size 90x14 starting at (138, 39).
; PLAN: r0=138(x), r1=39(y), r2=90(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 39
LDI r2, 90
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
