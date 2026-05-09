; DESCRIPTION: Renders a purple box of size 60x73 starting at (376, 63).
; PLAN: r0=376(x), r1=63(y), r2=60(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 63
LDI r2, 60
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
