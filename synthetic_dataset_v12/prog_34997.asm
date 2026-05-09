; DESCRIPTION: Renders a black box of size 34x11 starting at (82, 227).
; PLAN: r0=82(x), r1=227(y), r2=34(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 227
LDI r2, 34
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
