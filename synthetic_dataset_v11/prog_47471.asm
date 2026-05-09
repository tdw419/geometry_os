; DESCRIPTION: Creates a purple rectangular region at (55, 194) spanning 108 by 58 pixels.
; PLAN: r0=55(x), r1=194(y), r2=108(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 194
LDI r2, 108
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
