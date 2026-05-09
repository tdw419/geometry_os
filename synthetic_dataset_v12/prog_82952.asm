; DESCRIPTION: Creates a black rectangular region at (202, 104) spanning 61 by 110 pixels.
; PLAN: r0=202(x), r1=104(y), r2=61(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 104
LDI r2, 61
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
