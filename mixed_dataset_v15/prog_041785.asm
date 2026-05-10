; DESCRIPTION: Renders a red box of size 89x100 starting at (288, 96).
; PLAN: r0=288(x), r1=96(y), r2=89(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 96
LDI r2, 89
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
