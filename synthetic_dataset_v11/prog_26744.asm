; DESCRIPTION: Creates a yellow rectangular region at (44, 125) spanning 23 by 116 pixels.
; PLAN: r0=44(x), r1=125(y), r2=23(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 125
LDI r2, 23
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
