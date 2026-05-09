; DESCRIPTION: Creates a white rectangular region at (83, 104) spanning 84 by 75 pixels.
; PLAN: r0=83(x), r1=104(y), r2=84(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 104
LDI r2, 84
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
