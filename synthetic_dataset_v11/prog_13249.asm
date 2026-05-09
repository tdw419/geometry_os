; DESCRIPTION: Creates a black rectangular region at (75, 22) spanning 17 by 61 pixels.
; PLAN: r0=75(x), r1=22(y), r2=17(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 22
LDI r2, 17
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
