; DESCRIPTION: Renders a blue box of size 55x34 starting at (145, 41).
; PLAN: r0=145(x), r1=41(y), r2=55(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 41
LDI r2, 55
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
