; DESCRIPTION: Renders a purple box of size 79x65 starting at (178, 22).
; PLAN: r0=178(x), r1=22(y), r2=79(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 22
LDI r2, 79
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
