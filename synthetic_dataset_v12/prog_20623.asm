; DESCRIPTION: Renders a purple box of size 64x88 starting at (254, 70).
; PLAN: r0=254(x), r1=70(y), r2=64(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 70
LDI r2, 64
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
