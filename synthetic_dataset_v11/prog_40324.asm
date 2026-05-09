; DESCRIPTION: Creates a purple rectangular region at (83, 142) spanning 34 by 43 pixels.
; PLAN: r0=83(x), r1=142(y), r2=34(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 142
LDI r2, 34
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
