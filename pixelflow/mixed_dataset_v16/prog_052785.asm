; DESCRIPTION: Creates a yellow rectangular region at (331, 39) spanning 110 by 112 pixels.
; PLAN: r0=331(x), r1=39(y), r2=110(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 39
LDI r2, 110
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
