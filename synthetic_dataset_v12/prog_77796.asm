; DESCRIPTION: Creates a purple rectangular region at (296, 56) spanning 97 by 99 pixels.
; PLAN: r0=296(x), r1=56(y), r2=97(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 56
LDI r2, 97
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
