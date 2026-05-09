; DESCRIPTION: Creates a yellow rectangular region at (414, 5) spanning 29 by 104 pixels.
; PLAN: r0=414(x), r1=5(y), r2=29(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 5
LDI r2, 29
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
