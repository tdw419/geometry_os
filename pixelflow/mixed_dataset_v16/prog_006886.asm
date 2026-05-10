; DESCRIPTION: Creates a black rectangular region at (289, 119) spanning 27 by 106 pixels.
; PLAN: r0=289(x), r1=119(y), r2=27(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 119
LDI r2, 27
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
