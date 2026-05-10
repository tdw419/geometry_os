; DESCRIPTION: Creates a purple rectangular region at (351, 121) spanning 91 by 91 pixels.
; PLAN: r0=351(x), r1=121(y), r2=91(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 121
LDI r2, 91
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
