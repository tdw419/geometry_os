; DESCRIPTION: Renders a purple box of size 111x71 starting at (249, 19).
; PLAN: r0=249(x), r1=19(y), r2=111(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 19
LDI r2, 111
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
