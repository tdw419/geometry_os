; DESCRIPTION: Creates a yellow rectangular region at (332, 145) spanning 119 by 79 pixels.
; PLAN: r0=332(x), r1=145(y), r2=119(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 145
LDI r2, 119
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
