; DESCRIPTION: Renders a purple box of size 39x89 starting at (43, 71).
; PLAN: r0=43(x), r1=71(y), r2=39(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 71
LDI r2, 39
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
