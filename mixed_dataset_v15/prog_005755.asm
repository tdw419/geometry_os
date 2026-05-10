; DESCRIPTION: Renders a purple box of size 93x89 starting at (17, 90).
; PLAN: r0=17(x), r1=90(y), r2=93(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 90
LDI r2, 93
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
