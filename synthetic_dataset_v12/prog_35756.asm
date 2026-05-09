; DESCRIPTION: Renders a yellow box of size 116x17 starting at (43, 71).
; PLAN: r0=43(x), r1=71(y), r2=116(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 71
LDI r2, 116
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
