; DESCRIPTION: Creates a black rectangular region at (93, 13) spanning 44 by 39 pixels.
; PLAN: r0=93(x), r1=13(y), r2=44(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 13
LDI r2, 44
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
