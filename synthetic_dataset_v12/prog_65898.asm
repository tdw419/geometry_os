; DESCRIPTION: Renders a purple box of size 32x109 starting at (5, 35).
; PLAN: r0=5(x), r1=35(y), r2=32(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 35
LDI r2, 32
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
