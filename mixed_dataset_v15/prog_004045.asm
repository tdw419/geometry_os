; DESCRIPTION: Creates a purple rectangular region at (325, 206) spanning 13 by 49 pixels.
; PLAN: r0=325(x), r1=206(y), r2=13(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 206
LDI r2, 13
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
