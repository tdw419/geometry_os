; DESCRIPTION: Renders a red box of size 71x34 starting at (155, 90).
; PLAN: r0=155(x), r1=90(y), r2=71(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 90
LDI r2, 71
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
