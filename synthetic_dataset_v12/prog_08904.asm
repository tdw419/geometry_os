; DESCRIPTION: Creates a yellow rectangular region at (331, 116) spanning 34 by 21 pixels.
; PLAN: r0=331(x), r1=116(y), r2=34(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 116
LDI r2, 34
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
