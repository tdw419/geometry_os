; DESCRIPTION: Renders a black box of size 88x84 starting at (301, 98).
; PLAN: r0=301(x), r1=98(y), r2=88(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 98
LDI r2, 88
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
