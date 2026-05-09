; DESCRIPTION: Creates a yellow rectangular region at (21, 104) spanning 69 by 39 pixels.
; PLAN: r0=21(x), r1=104(y), r2=69(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 104
LDI r2, 69
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
