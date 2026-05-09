; DESCRIPTION: Creates a yellow rectangular region at (119, 53) spanning 86 by 87 pixels.
; PLAN: r0=119(x), r1=53(y), r2=86(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 53
LDI r2, 86
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
