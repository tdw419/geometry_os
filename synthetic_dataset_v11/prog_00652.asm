; DESCRIPTION: Renders a red box of size 40x24 starting at (51, 116).
; PLAN: r0=51(x), r1=116(y), r2=40(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 116
LDI r2, 40
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
