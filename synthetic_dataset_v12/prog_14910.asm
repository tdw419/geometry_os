; DESCRIPTION: Renders a purple box of size 18x26 starting at (355, 98).
; PLAN: r0=355(x), r1=98(y), r2=18(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 98
LDI r2, 18
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
