; DESCRIPTION: Creates a white rectangular region at (376, 10) spanning 107 by 49 pixels.
; PLAN: r0=376(x), r1=10(y), r2=107(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 10
LDI r2, 107
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
