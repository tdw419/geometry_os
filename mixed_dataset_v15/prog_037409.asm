; DESCRIPTION: Creates a yellow rectangular region at (43, 30) spanning 104 by 106 pixels.
; PLAN: r0=43(x), r1=30(y), r2=104(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 30
LDI r2, 104
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
