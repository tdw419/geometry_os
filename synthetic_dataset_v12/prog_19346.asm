; DESCRIPTION: Renders a purple box of size 43x15 starting at (9, 218).
; PLAN: r0=9(x), r1=218(y), r2=43(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 218
LDI r2, 43
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
