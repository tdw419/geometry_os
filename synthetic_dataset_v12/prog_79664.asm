; DESCRIPTION: Creates a purple rectangular region at (285, 192) spanning 84 by 11 pixels.
; PLAN: r0=285(x), r1=192(y), r2=84(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 192
LDI r2, 84
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
