; DESCRIPTION: Renders a black box of size 116x19 starting at (38, 227).
; PLAN: r0=38(x), r1=227(y), r2=116(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 227
LDI r2, 116
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
