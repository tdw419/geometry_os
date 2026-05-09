; DESCRIPTION: Creates a black rectangular region at (185, 50) spanning 61 by 78 pixels.
; PLAN: r0=185(x), r1=50(y), r2=61(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 50
LDI r2, 61
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
