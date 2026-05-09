; DESCRIPTION: Renders a purple box of size 100x88 starting at (108, 24).
; PLAN: r0=108(x), r1=24(y), r2=100(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 24
LDI r2, 100
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
