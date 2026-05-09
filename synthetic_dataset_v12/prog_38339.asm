; DESCRIPTION: Creates a black rectangular region at (34, 77) spanning 115 by 92 pixels.
; PLAN: r0=34(x), r1=77(y), r2=115(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 77
LDI r2, 115
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
