; DESCRIPTION: Renders a purple box of size 29x73 starting at (183, 160).
; PLAN: r0=183(x), r1=160(y), r2=29(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 160
LDI r2, 29
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
