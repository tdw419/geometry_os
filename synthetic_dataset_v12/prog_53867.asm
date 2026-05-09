; DESCRIPTION: Renders a yellow box of size 19x116 starting at (226, 36).
; PLAN: r0=226(x), r1=36(y), r2=19(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 36
LDI r2, 19
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
