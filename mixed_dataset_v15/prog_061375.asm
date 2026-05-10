; DESCRIPTION: Renders a purple box of size 60x103 starting at (289, 85).
; PLAN: r0=289(x), r1=85(y), r2=60(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 85
LDI r2, 60
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
