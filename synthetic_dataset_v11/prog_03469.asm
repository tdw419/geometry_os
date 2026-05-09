; DESCRIPTION: Creates a black rectangular region at (56, 35) spanning 35 by 77 pixels.
; PLAN: r0=56(x), r1=35(y), r2=35(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 35
LDI r2, 35
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
