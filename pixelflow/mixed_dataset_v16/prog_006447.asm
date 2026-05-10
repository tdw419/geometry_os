; DESCRIPTION: Renders a purple box of size 67x38 starting at (306, 137).
; PLAN: r0=306(x), r1=137(y), r2=67(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 137
LDI r2, 67
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
