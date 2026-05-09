; DESCRIPTION: Renders a blue box of size 39x41 starting at (26, 121).
; PLAN: r0=26(x), r1=121(y), r2=39(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 121
LDI r2, 39
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
