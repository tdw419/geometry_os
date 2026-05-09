; DESCRIPTION: Creates a white rectangular region at (22, 198) spanning 104 by 45 pixels.
; PLAN: r0=22(x), r1=198(y), r2=104(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 198
LDI r2, 104
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
