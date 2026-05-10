; DESCRIPTION: Creates a purple rectangular region at (162, 78) spanning 62 by 16 pixels.
; PLAN: r0=162(x), r1=78(y), r2=62(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 78
LDI r2, 62
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
