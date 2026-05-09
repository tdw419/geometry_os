; DESCRIPTION: Renders a black box of size 88x120 starting at (219, 58).
; PLAN: r0=219(x), r1=58(y), r2=88(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 58
LDI r2, 88
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
