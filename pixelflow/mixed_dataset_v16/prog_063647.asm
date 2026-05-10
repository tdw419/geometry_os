; DESCRIPTION: Creates a purple rectangular region at (278, 85) spanning 26 by 57 pixels.
; PLAN: r0=278(x), r1=85(y), r2=26(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 85
LDI r2, 26
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
