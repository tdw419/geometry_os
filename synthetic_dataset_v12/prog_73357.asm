; DESCRIPTION: Renders a yellow box of size 74x96 starting at (214, 100).
; PLAN: r0=214(x), r1=100(y), r2=74(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 100
LDI r2, 74
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
