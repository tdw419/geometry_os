; DESCRIPTION: Creates a black rectangular region at (289, 190) spanning 86 by 35 pixels.
; PLAN: r0=289(x), r1=190(y), r2=86(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 190
LDI r2, 86
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
