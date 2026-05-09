; DESCRIPTION: Renders a purple box of size 67x20 starting at (44, 155).
; PLAN: r0=44(x), r1=155(y), r2=67(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 155
LDI r2, 67
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
