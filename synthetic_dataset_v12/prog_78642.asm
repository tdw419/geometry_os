; DESCRIPTION: Renders a purple box of size 58x76 starting at (121, 100).
; PLAN: r0=121(x), r1=100(y), r2=58(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 100
LDI r2, 58
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
