; DESCRIPTION: Renders a purple box of size 13x11 starting at (70, 145).
; PLAN: r0=70(x), r1=145(y), r2=13(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 145
LDI r2, 13
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
