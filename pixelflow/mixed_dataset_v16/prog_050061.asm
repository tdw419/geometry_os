; DESCRIPTION: Creates a yellow rectangular region at (145, 95) spanning 97 by 105 pixels.
; PLAN: r0=145(x), r1=95(y), r2=97(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 95
LDI r2, 97
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
