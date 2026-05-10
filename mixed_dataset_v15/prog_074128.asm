; DESCRIPTION: Renders a red box of size 41x88 starting at (140, 79).
; PLAN: r0=140(x), r1=79(y), r2=41(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 79
LDI r2, 41
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
