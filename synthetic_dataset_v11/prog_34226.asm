; DESCRIPTION: Creates a white rectangular region at (183, 104) spanning 21 by 15 pixels.
; PLAN: r0=183(x), r1=104(y), r2=21(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 104
LDI r2, 21
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
