; DESCRIPTION: Creates a blue rectangular region at (339, 23) spanning 104 by 58 pixels.
; PLAN: r0=339(x), r1=23(y), r2=104(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 23
LDI r2, 104
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
