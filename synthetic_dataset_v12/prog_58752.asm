; DESCRIPTION: Creates a purple rectangular region at (1, 218) spanning 26 by 26 pixels.
; PLAN: r0=1(x), r1=218(y), r2=26(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 218
LDI r2, 26
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
