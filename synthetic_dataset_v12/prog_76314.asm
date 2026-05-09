; DESCRIPTION: Creates a black rectangular region at (299, 48) spanning 119 by 28 pixels.
; PLAN: r0=299(x), r1=48(y), r2=119(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 48
LDI r2, 119
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
