; DESCRIPTION: Renders a purple box of size 83x79 starting at (327, 145).
; PLAN: r0=327(x), r1=145(y), r2=83(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 145
LDI r2, 83
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
