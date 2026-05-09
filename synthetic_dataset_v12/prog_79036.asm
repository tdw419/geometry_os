; DESCRIPTION: Creates a purple rectangular region at (407, 97) spanning 81 by 37 pixels.
; PLAN: r0=407(x), r1=97(y), r2=81(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 97
LDI r2, 81
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
