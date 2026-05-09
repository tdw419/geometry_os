; DESCRIPTION: Renders a purple box of size 71x108 starting at (170, 134).
; PLAN: r0=170(x), r1=134(y), r2=71(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 134
LDI r2, 71
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
