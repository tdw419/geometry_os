; DESCRIPTION: Creates a yellow rectangular region at (97, 72) spanning 10 by 37 pixels.
; PLAN: r0=97(x), r1=72(y), r2=10(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 72
LDI r2, 10
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
