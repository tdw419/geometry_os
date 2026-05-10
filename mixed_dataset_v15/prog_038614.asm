; DESCRIPTION: Creates a yellow rectangular region at (124, 34) spanning 95 by 56 pixels.
; PLAN: r0=124(x), r1=34(y), r2=95(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 34
LDI r2, 95
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
