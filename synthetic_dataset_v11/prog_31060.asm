; DESCRIPTION: Renders a purple box of size 24x27 starting at (201, 133).
; PLAN: r0=201(x), r1=133(y), r2=24(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 133
LDI r2, 24
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
