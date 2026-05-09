; DESCRIPTION: Renders a purple box of size 88x14 starting at (335, 240).
; PLAN: r0=335(x), r1=240(y), r2=88(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 240
LDI r2, 88
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
