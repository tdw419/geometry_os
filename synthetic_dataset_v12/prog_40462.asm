; DESCRIPTION: Creates a yellow rectangular region at (57, 52) spanning 96 by 33 pixels.
; PLAN: r0=57(x), r1=52(y), r2=96(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 52
LDI r2, 96
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
