; DESCRIPTION: Creates a purple rectangular region at (428, 55) spanning 31 by 19 pixels.
; PLAN: r0=428(x), r1=55(y), r2=31(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 55
LDI r2, 31
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
