; DESCRIPTION: Renders a purple box of size 87x85 starting at (140, 24).
; PLAN: r0=140(x), r1=24(y), r2=87(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 24
LDI r2, 87
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
