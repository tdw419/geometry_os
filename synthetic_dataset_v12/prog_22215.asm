; DESCRIPTION: Renders a purple box of size 43x40 starting at (458, 182).
; PLAN: r0=458(x), r1=182(y), r2=43(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 182
LDI r2, 43
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
