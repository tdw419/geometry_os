; DESCRIPTION: Renders a red box of size 110x57 starting at (88, 144).
; PLAN: r0=88(x), r1=144(y), r2=110(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 144
LDI r2, 110
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
