; DESCRIPTION: Renders a black box of size 76x62 starting at (236, 18).
; PLAN: r0=236(x), r1=18(y), r2=76(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 18
LDI r2, 76
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
