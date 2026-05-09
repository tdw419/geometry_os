; DESCRIPTION: Creates a green rectangular region at (37, 114) spanning 38 by 104 pixels.
; PLAN: r0=37(x), r1=114(y), r2=38(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 114
LDI r2, 38
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
