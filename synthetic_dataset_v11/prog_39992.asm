; DESCRIPTION: Creates a yellow rectangular region at (4, 114) spanning 100 by 46 pixels.
; PLAN: r0=4(x), r1=114(y), r2=100(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 114
LDI r2, 100
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
