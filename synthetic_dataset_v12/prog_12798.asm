; DESCRIPTION: Creates a purple rectangular region at (244, 1) spanning 13 by 44 pixels.
; PLAN: r0=244(x), r1=1(y), r2=13(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 1
LDI r2, 13
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
