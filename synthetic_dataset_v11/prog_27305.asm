; DESCRIPTION: Renders a black box of size 88x88 starting at (126, 62).
; PLAN: r0=126(x), r1=62(y), r2=88(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 62
LDI r2, 88
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
