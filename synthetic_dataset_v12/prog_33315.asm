; DESCRIPTION: Renders a red box of size 73x26 starting at (155, 20).
; PLAN: r0=155(x), r1=20(y), r2=73(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 20
LDI r2, 73
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
