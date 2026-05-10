; DESCRIPTION: Renders a purple rectangular region spanning 90 by 84 at (24, 37).
; PLAN: r0=24(x), r1=37(y), r2=90(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 37
LDI r2, 90
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
