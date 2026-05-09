; DESCRIPTION: Creates a purple rectangular region at (195, 36) spanning 40 by 84 pixels.
; PLAN: r0=195(x), r1=36(y), r2=40(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 36
LDI r2, 40
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
