; DESCRIPTION: Creates a yellow rectangular region at (388, 139) spanning 104 by 105 pixels.
; PLAN: r0=388(x), r1=139(y), r2=104(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 139
LDI r2, 104
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
