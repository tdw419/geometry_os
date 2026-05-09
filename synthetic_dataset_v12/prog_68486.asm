; DESCRIPTION: Creates a purple rectangular region at (55, 32) spanning 105 by 84 pixels.
; PLAN: r0=55(x), r1=32(y), r2=105(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 32
LDI r2, 105
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
