; DESCRIPTION: Renders a red box of size 58x66 starting at (41, 137).
; PLAN: r0=41(x), r1=137(y), r2=58(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 137
LDI r2, 58
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
