; DESCRIPTION: Renders a red box of size 88x41 starting at (75, 197).
; PLAN: r0=75(x), r1=197(y), r2=88(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 197
LDI r2, 88
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
