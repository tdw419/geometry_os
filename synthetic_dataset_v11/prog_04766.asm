; DESCRIPTION: Creates a yellow rectangular region at (13, 171) spanning 110 by 47 pixels.
; PLAN: r0=13(x), r1=171(y), r2=110(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 171
LDI r2, 110
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
