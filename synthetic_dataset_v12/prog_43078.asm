; DESCRIPTION: Renders a yellow box of size 108x116 starting at (259, 56).
; PLAN: r0=259(x), r1=56(y), r2=108(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 56
LDI r2, 108
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
