; DESCRIPTION: Renders a purple box of size 41x69 starting at (353, 107).
; PLAN: r0=353(x), r1=107(y), r2=41(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 107
LDI r2, 41
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
