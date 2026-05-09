; DESCRIPTION: Creates a black rectangular region at (285, 170) spanning 116 by 86 pixels.
; PLAN: r0=285(x), r1=170(y), r2=116(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 170
LDI r2, 116
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
