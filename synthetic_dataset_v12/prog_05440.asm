; DESCRIPTION: Creates a red rectangular region at (376, 34) spanning 45 by 110 pixels.
; PLAN: r0=376(x), r1=34(y), r2=45(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 34
LDI r2, 45
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
