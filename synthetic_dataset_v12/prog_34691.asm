; DESCRIPTION: Renders a blue box of size 41x75 starting at (219, 114).
; PLAN: r0=219(x), r1=114(y), r2=41(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 114
LDI r2, 41
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
