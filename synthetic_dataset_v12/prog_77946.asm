; DESCRIPTION: Creates a purple rectangular region at (137, 54) spanning 46 by 114 pixels.
; PLAN: r0=137(x), r1=54(y), r2=46(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 54
LDI r2, 46
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
