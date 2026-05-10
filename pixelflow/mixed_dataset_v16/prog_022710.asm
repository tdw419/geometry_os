; DESCRIPTION: Creates a purple rectangular region at (219, 115) spanning 62 by 37 pixels.
; PLAN: r0=219(x), r1=115(y), r2=62(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 115
LDI r2, 62
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
