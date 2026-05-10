; DESCRIPTION: Renders a red box of size 108x76 starting at (194, 116).
; PLAN: r0=194(x), r1=116(y), r2=108(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 116
LDI r2, 108
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
