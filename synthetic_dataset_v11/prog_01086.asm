; DESCRIPTION: Creates a yellow rectangular region at (80, 104) spanning 67 by 78 pixels.
; PLAN: r0=80(x), r1=104(y), r2=67(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 104
LDI r2, 67
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
