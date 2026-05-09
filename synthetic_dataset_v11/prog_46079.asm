; DESCRIPTION: Creates a yellow rectangular region at (155, 139) spanning 86 by 10 pixels.
; PLAN: r0=155(x), r1=139(y), r2=86(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 139
LDI r2, 86
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
