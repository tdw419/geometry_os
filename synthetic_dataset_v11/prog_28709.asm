; DESCRIPTION: Creates a green rectangular region at (134, 131) spanning 96 by 104 pixels.
; PLAN: r0=134(x), r1=131(y), r2=96(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 131
LDI r2, 96
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
