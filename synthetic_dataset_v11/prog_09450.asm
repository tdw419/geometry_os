; DESCRIPTION: Renders a purple box of size 60x90 starting at (84, 52).
; PLAN: r0=84(x), r1=52(y), r2=60(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 52
LDI r2, 60
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
