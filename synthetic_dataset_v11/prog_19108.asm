; DESCRIPTION: Creates a purple rectangular region at (55, 35) spanning 54 by 84 pixels.
; PLAN: r0=55(x), r1=35(y), r2=54(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 35
LDI r2, 54
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
