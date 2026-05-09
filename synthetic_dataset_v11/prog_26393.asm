; DESCRIPTION: Renders a blue box of size 41x112 starting at (90, 102).
; PLAN: r0=90(x), r1=102(y), r2=41(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 102
LDI r2, 41
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
