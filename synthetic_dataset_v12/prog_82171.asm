; DESCRIPTION: Renders a purple box of size 34x69 starting at (352, 145).
; PLAN: r0=352(x), r1=145(y), r2=34(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 145
LDI r2, 34
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
