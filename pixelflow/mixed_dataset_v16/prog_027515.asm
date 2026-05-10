; DESCRIPTION: Creates a yellow rectangular region at (343, 138) spanning 110 by 59 pixels.
; PLAN: r0=343(x), r1=138(y), r2=110(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 138
LDI r2, 110
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
