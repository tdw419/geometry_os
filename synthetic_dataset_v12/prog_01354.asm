; DESCRIPTION: Renders a purple box of size 110x70 starting at (85, 159).
; PLAN: r0=85(x), r1=159(y), r2=110(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 159
LDI r2, 110
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
