; DESCRIPTION: Renders a purple box of size 38x73 starting at (423, 165).
; PLAN: r0=423(x), r1=165(y), r2=38(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 165
LDI r2, 38
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
