; DESCRIPTION: Creates a black rectangular region at (289, 121) spanning 95 by 21 pixels.
; PLAN: r0=289(x), r1=121(y), r2=95(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 121
LDI r2, 95
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
