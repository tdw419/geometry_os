; DESCRIPTION: Renders a purple box of size 97x85 starting at (200, 83).
; PLAN: r0=200(x), r1=83(y), r2=97(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 83
LDI r2, 97
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
