; DESCRIPTION: Creates a yellow rectangular region at (195, 138) spanning 78 by 114 pixels.
; PLAN: r0=195(x), r1=138(y), r2=78(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 138
LDI r2, 78
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
