; DESCRIPTION: Renders a black box of size 52x84 starting at (76, 36).
; PLAN: r0=76(x), r1=36(y), r2=52(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 36
LDI r2, 52
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
