; DESCRIPTION: Creates a yellow rectangular region at (331, 153) spanning 73 by 57 pixels.
; PLAN: r0=331(x), r1=153(y), r2=73(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 153
LDI r2, 73
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
