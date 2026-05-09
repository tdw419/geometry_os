; DESCRIPTION: Creates a yellow rectangular region at (199, 166) spanning 44 by 78 pixels.
; PLAN: r0=199(x), r1=166(y), r2=44(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 166
LDI r2, 44
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
