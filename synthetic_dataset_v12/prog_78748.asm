; DESCRIPTION: Creates a green rectangular region at (300, 101) spanning 104 by 104 pixels.
; PLAN: r0=300(x), r1=101(y), r2=104(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 101
LDI r2, 104
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
