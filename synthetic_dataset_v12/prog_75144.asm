; DESCRIPTION: Creates a purple rectangular region at (76, 99) spanning 24 by 84 pixels.
; PLAN: r0=76(x), r1=99(y), r2=24(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 99
LDI r2, 24
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
