; DESCRIPTION: Renders a red box of size 73x88 starting at (124, 155).
; PLAN: r0=124(x), r1=155(y), r2=73(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 155
LDI r2, 73
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
