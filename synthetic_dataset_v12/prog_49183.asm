; DESCRIPTION: Renders a red box of size 26x119 starting at (352, 78).
; PLAN: r0=352(x), r1=78(y), r2=26(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 78
LDI r2, 26
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
