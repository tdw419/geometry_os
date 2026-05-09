; DESCRIPTION: Creates a purple rectangular region at (124, 33) spanning 87 by 97 pixels.
; PLAN: r0=124(x), r1=33(y), r2=87(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 33
LDI r2, 87
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
