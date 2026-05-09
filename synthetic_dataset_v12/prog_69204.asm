; DESCRIPTION: Renders a purple box of size 39x19 starting at (17, 169).
; PLAN: r0=17(x), r1=169(y), r2=39(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 169
LDI r2, 39
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
