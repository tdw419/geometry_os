; DESCRIPTION: Creates a yellow rectangular region at (221, 104) spanning 87 by 30 pixels.
; PLAN: r0=221(x), r1=104(y), r2=87(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 104
LDI r2, 87
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
