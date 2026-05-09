; DESCRIPTION: Creates a yellow rectangular region at (447, 47) spanning 37 by 97 pixels.
; PLAN: r0=447(x), r1=47(y), r2=37(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 47
LDI r2, 37
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
