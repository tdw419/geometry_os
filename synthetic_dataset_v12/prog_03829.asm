; DESCRIPTION: Renders a purple box of size 112x62 starting at (171, 53).
; PLAN: r0=171(x), r1=53(y), r2=112(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 53
LDI r2, 112
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
