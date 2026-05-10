; DESCRIPTION: Creates a purple rectangular region at (373, 63) spanning 84 by 114 pixels.
; PLAN: r0=373(x), r1=63(y), r2=84(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 63
LDI r2, 84
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
