; DESCRIPTION: Renders a blue box of size 41x103 starting at (2, 72).
; PLAN: r0=2(x), r1=72(y), r2=41(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 72
LDI r2, 41
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
