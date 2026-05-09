; DESCRIPTION: Renders a purple box of size 31x105 starting at (165, 145).
; PLAN: r0=165(x), r1=145(y), r2=31(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 145
LDI r2, 31
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
