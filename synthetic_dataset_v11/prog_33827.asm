; DESCRIPTION: Renders a purple box of size 44x92 starting at (26, 140).
; PLAN: r0=26(x), r1=140(y), r2=44(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 140
LDI r2, 44
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
