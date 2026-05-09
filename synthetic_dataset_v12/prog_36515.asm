; DESCRIPTION: Renders a red box of size 17x101 starting at (253, 80).
; PLAN: r0=253(x), r1=80(y), r2=17(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 80
LDI r2, 17
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
