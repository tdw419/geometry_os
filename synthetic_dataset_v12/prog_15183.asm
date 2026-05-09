; DESCRIPTION: Renders a red box of size 118x90 starting at (181, 116).
; PLAN: r0=181(x), r1=116(y), r2=118(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 116
LDI r2, 118
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
