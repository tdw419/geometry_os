; DESCRIPTION: Creates a yellow rectangular region at (116, 29) spanning 72 by 56 pixels.
; PLAN: r0=116(x), r1=29(y), r2=72(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 29
LDI r2, 72
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
