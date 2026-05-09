; DESCRIPTION: Creates a purple rectangular region at (378, 79) spanning 99 by 24 pixels.
; PLAN: r0=378(x), r1=79(y), r2=99(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 79
LDI r2, 99
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
