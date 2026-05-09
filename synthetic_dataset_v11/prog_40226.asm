; DESCRIPTION: Creates a yellow rectangular region at (44, 21) spanning 53 by 99 pixels.
; PLAN: r0=44(x), r1=21(y), r2=53(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 21
LDI r2, 53
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
