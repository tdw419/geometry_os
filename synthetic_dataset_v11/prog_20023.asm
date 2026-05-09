; DESCRIPTION: Creates a purple rectangular region at (97, 16) spanning 105 by 38 pixels.
; PLAN: r0=97(x), r1=16(y), r2=105(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 16
LDI r2, 105
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
