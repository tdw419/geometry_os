; DESCRIPTION: Creates a purple rectangular region at (222, 108) spanning 10 by 119 pixels.
; PLAN: r0=222(x), r1=108(y), r2=10(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 108
LDI r2, 10
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
