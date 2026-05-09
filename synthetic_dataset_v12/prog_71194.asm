; DESCRIPTION: Creates a purple rectangular region at (428, 29) spanning 80 by 56 pixels.
; PLAN: r0=428(x), r1=29(y), r2=80(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 29
LDI r2, 80
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
