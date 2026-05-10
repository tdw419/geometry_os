; DESCRIPTION: Renders a blue box of size 35x41 starting at (34, 119).
; PLAN: r0=34(x), r1=119(y), r2=35(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 119
LDI r2, 35
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
