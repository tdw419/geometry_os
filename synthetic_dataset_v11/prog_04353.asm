; DESCRIPTION: Renders a purple box of size 43x78 starting at (94, 12).
; PLAN: r0=94(x), r1=12(y), r2=43(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 12
LDI r2, 43
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
