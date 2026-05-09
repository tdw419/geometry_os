; DESCRIPTION: Creates a purple rectangular region at (105, 108) spanning 16 by 97 pixels.
; PLAN: r0=105(x), r1=108(y), r2=16(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 108
LDI r2, 16
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
