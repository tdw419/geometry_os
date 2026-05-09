; DESCRIPTION: Renders a blue box of size 106x48 starting at (170, 41).
; PLAN: r0=170(x), r1=41(y), r2=106(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 41
LDI r2, 106
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
