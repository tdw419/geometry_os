; DESCRIPTION: Renders a purple box of size 62x76 starting at (40, 19).
; PLAN: r0=40(x), r1=19(y), r2=62(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 19
LDI r2, 62
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
