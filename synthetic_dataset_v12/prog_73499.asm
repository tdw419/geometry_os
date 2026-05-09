; DESCRIPTION: Creates a white rectangular region at (392, 15) spanning 83 by 104 pixels.
; PLAN: r0=392(x), r1=15(y), r2=83(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 15
LDI r2, 83
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
