; DESCRIPTION: Creates a white rectangular region at (376, 110) spanning 60 by 45 pixels.
; PLAN: r0=376(x), r1=110(y), r2=60(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 110
LDI r2, 60
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
