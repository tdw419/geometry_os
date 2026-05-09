; DESCRIPTION: Creates a yellow rectangular region at (73, 203) spanning 15 by 44 pixels.
; PLAN: r0=73(x), r1=203(y), r2=15(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 203
LDI r2, 15
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
