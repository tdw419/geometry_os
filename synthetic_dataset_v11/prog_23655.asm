; DESCRIPTION: Creates a yellow rectangular region at (145, 145) spanning 105 by 84 pixels.
; PLAN: r0=145(x), r1=145(y), r2=105(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 145
LDI r2, 105
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
