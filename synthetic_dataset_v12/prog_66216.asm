; DESCRIPTION: Renders a purple box of size 19x14 starting at (116, 145).
; PLAN: r0=116(x), r1=145(y), r2=19(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 145
LDI r2, 19
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
