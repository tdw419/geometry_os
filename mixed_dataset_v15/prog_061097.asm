; DESCRIPTION: Creates a yellow rectangular region at (185, 22) spanning 84 by 61 pixels.
; PLAN: r0=185(x), r1=22(y), r2=84(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 22
LDI r2, 84
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
