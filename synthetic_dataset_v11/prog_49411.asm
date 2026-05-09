; DESCRIPTION: Renders a purple box of size 65x33 starting at (63, 43).
; PLAN: r0=63(x), r1=43(y), r2=65(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 43
LDI r2, 65
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
