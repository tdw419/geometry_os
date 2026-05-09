; DESCRIPTION: Creates a black rectangular region at (376, 47) spanning 72 by 118 pixels.
; PLAN: r0=376(x), r1=47(y), r2=72(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 47
LDI r2, 72
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
