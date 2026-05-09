; DESCRIPTION: Renders a purple box of size 79x45 starting at (351, 116).
; PLAN: r0=351(x), r1=116(y), r2=79(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 116
LDI r2, 79
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
