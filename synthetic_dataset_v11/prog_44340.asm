; DESCRIPTION: Creates a yellow rectangular region at (138, 114) spanning 32 by 97 pixels.
; PLAN: r0=138(x), r1=114(y), r2=32(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 114
LDI r2, 32
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
