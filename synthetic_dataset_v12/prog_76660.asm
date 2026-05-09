; DESCRIPTION: Renders a black box of size 88x108 starting at (220, 116).
; PLAN: r0=220(x), r1=116(y), r2=88(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 116
LDI r2, 88
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
