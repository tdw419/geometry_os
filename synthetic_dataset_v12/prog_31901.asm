; DESCRIPTION: Renders a purple box of size 36x73 starting at (234, 119).
; PLAN: r0=234(x), r1=119(y), r2=36(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 119
LDI r2, 36
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
