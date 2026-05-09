; DESCRIPTION: Creates a white rectangular region at (134, 3) spanning 110 by 104 pixels.
; PLAN: r0=134(x), r1=3(y), r2=110(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 3
LDI r2, 110
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
