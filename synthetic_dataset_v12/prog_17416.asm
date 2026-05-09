; DESCRIPTION: Creates a purple rectangular region at (441, 145) spanning 68 by 40 pixels.
; PLAN: r0=441(x), r1=145(y), r2=68(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 145
LDI r2, 68
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
