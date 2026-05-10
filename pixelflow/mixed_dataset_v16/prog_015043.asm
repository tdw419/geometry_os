; DESCRIPTION: Creates a yellow rectangular region at (199, 61) spanning 20 by 33 pixels.
; PLAN: r0=199(x), r1=61(y), r2=20(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 61
LDI r2, 20
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
