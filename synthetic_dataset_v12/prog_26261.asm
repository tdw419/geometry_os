; DESCRIPTION: Creates a purple rectangular region at (145, 97) spanning 109 by 99 pixels.
; PLAN: r0=145(x), r1=97(y), r2=109(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 97
LDI r2, 109
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
