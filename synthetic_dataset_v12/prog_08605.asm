; DESCRIPTION: Creates a purple rectangular region at (44, 91) spanning 37 by 114 pixels.
; PLAN: r0=44(x), r1=91(y), r2=37(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 91
LDI r2, 37
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
