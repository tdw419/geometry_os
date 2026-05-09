; DESCRIPTION: Renders a blue box of size 19x22 starting at (362, 41).
; PLAN: r0=362(x), r1=41(y), r2=19(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 41
LDI r2, 19
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
