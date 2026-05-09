; DESCRIPTION: Renders a purple box of size 67x94 starting at (100, 73).
; PLAN: r0=100(x), r1=73(y), r2=67(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 73
LDI r2, 67
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
