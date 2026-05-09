; DESCRIPTION: Renders a red box of size 41x65 starting at (382, 88).
; PLAN: r0=382(x), r1=88(y), r2=41(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 88
LDI r2, 41
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
