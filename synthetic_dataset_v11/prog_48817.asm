; DESCRIPTION: Renders a purple box of size 79x84 starting at (44, 153).
; PLAN: r0=44(x), r1=153(y), r2=79(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 153
LDI r2, 79
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
