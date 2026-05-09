; DESCRIPTION: Creates a green rectangular region at (102, 94) spanning 104 by 25 pixels.
; PLAN: r0=102(x), r1=94(y), r2=104(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 94
LDI r2, 104
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
