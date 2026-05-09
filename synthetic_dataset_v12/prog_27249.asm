; DESCRIPTION: Creates a purple rectangular region at (6, 186) spanning 97 by 32 pixels.
; PLAN: r0=6(x), r1=186(y), r2=97(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 186
LDI r2, 97
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
