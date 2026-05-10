; DESCRIPTION: Creates a blue rectangular region at (318, 92) spanning 106 by 76 pixels.
; PLAN: r0=318(x), r1=92(y), r2=106(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 92
LDI r2, 106
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
