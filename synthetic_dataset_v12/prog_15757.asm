; DESCRIPTION: Renders a red box of size 10x116 starting at (134, 101).
; PLAN: r0=134(x), r1=101(y), r2=10(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 101
LDI r2, 10
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
