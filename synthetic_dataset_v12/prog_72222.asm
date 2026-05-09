; DESCRIPTION: Renders a purple box of size 36x76 starting at (133, 19).
; PLAN: r0=133(x), r1=19(y), r2=36(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 19
LDI r2, 36
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
