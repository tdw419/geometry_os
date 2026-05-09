; DESCRIPTION: Renders a purple box of size 39x88 starting at (381, 121).
; PLAN: r0=381(x), r1=121(y), r2=39(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 121
LDI r2, 39
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
