; DESCRIPTION: Renders a red box of size 41x114 starting at (418, 100).
; PLAN: r0=418(x), r1=100(y), r2=41(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 100
LDI r2, 41
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
