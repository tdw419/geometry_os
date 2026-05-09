; DESCRIPTION: Creates a yellow rectangular region at (31, 195) spanning 114 by 17 pixels.
; PLAN: r0=31(x), r1=195(y), r2=114(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 195
LDI r2, 114
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
