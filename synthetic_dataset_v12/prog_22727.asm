; DESCRIPTION: Renders a purple box of size 89x99 starting at (67, 25).
; PLAN: r0=67(x), r1=25(y), r2=89(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 25
LDI r2, 89
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
