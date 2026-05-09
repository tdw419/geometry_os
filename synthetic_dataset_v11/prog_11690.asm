; DESCRIPTION: Creates a purple rectangular region at (128, 84) spanning 33 by 109 pixels.
; PLAN: r0=128(x), r1=84(y), r2=33(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 84
LDI r2, 33
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
