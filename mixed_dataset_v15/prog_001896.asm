; DESCRIPTION: Renders a purple box of size 37x21 starting at (174, 79).
; PLAN: r0=174(x), r1=79(y), r2=37(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 79
LDI r2, 37
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
