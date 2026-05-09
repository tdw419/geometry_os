; DESCRIPTION: Renders a purple box of size 100x28 starting at (359, 140).
; PLAN: r0=359(x), r1=140(y), r2=100(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 140
LDI r2, 100
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
