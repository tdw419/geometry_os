; DESCRIPTION: Creates a green rectangular region at (199, 139) spanning 43 by 87 pixels.
; PLAN: r0=199(x), r1=139(y), r2=43(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 139
LDI r2, 43
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
