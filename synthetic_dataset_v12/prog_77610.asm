; DESCRIPTION: Renders a purple box of size 40x15 starting at (306, 99).
; PLAN: r0=306(x), r1=99(y), r2=40(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 99
LDI r2, 40
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
