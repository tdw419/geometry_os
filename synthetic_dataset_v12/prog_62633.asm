; DESCRIPTION: Renders a purple box of size 43x99 starting at (307, 145).
; PLAN: r0=307(x), r1=145(y), r2=43(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 145
LDI r2, 43
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
