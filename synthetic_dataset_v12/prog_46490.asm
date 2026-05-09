; DESCRIPTION: Creates a black rectangular region at (97, 66) spanning 93 by 71 pixels.
; PLAN: r0=97(x), r1=66(y), r2=93(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 66
LDI r2, 93
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
