; DESCRIPTION: Renders a purple box of size 60x24 starting at (78, 220).
; PLAN: r0=78(x), r1=220(y), r2=60(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 220
LDI r2, 60
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
