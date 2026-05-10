; DESCRIPTION: Creates a yellow rectangular region at (339, 199) spanning 59 by 56 pixels.
; PLAN: r0=339(x), r1=199(y), r2=59(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 199
LDI r2, 59
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
