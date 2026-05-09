; DESCRIPTION: Creates a yellow rectangular region at (44, 114) spanning 14 by 91 pixels.
; PLAN: r0=44(x), r1=114(y), r2=14(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 114
LDI r2, 14
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
