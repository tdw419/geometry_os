; DESCRIPTION: Creates a purple rectangular region at (289, 35) spanning 31 by 109 pixels.
; PLAN: r0=289(x), r1=35(y), r2=31(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 35
LDI r2, 31
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
