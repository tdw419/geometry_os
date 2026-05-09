; DESCRIPTION: Creates a yellow rectangular region at (157, 87) spanning 72 by 52 pixels.
; PLAN: r0=157(x), r1=87(y), r2=72(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 87
LDI r2, 72
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
