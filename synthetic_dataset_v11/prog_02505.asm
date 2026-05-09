; DESCRIPTION: Creates a white rectangular region at (30, 76) spanning 37 by 104 pixels.
; PLAN: r0=30(x), r1=76(y), r2=37(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 76
LDI r2, 37
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
