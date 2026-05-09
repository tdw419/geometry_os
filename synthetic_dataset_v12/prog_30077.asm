; DESCRIPTION: Creates a purple rectangular region at (74, 37) spanning 97 by 10 pixels.
; PLAN: r0=74(x), r1=37(y), r2=97(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 37
LDI r2, 97
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
