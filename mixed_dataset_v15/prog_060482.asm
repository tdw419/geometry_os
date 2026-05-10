; DESCRIPTION: Creates a black rectangular region at (356, 155) spanning 115 by 77 pixels.
; PLAN: r0=356(x), r1=155(y), r2=115(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 155
LDI r2, 115
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
