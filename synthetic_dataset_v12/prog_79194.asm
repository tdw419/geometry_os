; DESCRIPTION: Renders a purple box of size 48x60 starting at (409, 183).
; PLAN: r0=409(x), r1=183(y), r2=48(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 183
LDI r2, 48
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
