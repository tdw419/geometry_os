; DESCRIPTION: Renders a purple box of size 67x105 starting at (71, 78).
; PLAN: r0=71(x), r1=78(y), r2=67(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 78
LDI r2, 67
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
