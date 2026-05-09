; DESCRIPTION: Renders a purple box of size 36x45 starting at (136, 90).
; PLAN: r0=136(x), r1=90(y), r2=36(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 90
LDI r2, 36
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
