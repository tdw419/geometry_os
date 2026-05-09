; DESCRIPTION: Renders a red box of size 92x14 starting at (390, 100).
; PLAN: r0=390(x), r1=100(y), r2=92(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 100
LDI r2, 92
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
