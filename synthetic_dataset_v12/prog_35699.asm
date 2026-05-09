; DESCRIPTION: Creates a white rectangular region at (376, 23) spanning 72 by 83 pixels.
; PLAN: r0=376(x), r1=23(y), r2=72(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 23
LDI r2, 72
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
