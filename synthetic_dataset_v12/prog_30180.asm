; DESCRIPTION: Creates a purple rectangular region at (264, 26) spanning 21 by 104 pixels.
; PLAN: r0=264(x), r1=26(y), r2=21(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 26
LDI r2, 21
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
