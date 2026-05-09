; DESCRIPTION: Creates a black rectangular region at (30, 31) spanning 90 by 61 pixels.
; PLAN: r0=30(x), r1=31(y), r2=90(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 31
LDI r2, 90
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
