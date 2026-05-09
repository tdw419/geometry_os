; DESCRIPTION: Renders a red box of size 15x41 starting at (272, 123).
; PLAN: r0=272(x), r1=123(y), r2=15(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 123
LDI r2, 15
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
