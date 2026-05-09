; DESCRIPTION: Renders a purple box of size 79x28 starting at (339, 9).
; PLAN: r0=339(x), r1=9(y), r2=79(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 9
LDI r2, 79
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
