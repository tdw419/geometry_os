; DESCRIPTION: Renders a purple box of size 35x25 starting at (109, 207).
; PLAN: r0=109(x), r1=207(y), r2=35(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 207
LDI r2, 35
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
