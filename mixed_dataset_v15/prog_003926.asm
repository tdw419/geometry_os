; DESCRIPTION: Renders a red box of size 103x66 starting at (78, 41).
; PLAN: r0=78(x), r1=41(y), r2=103(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 41
LDI r2, 103
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
