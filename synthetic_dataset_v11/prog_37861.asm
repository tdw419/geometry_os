; DESCRIPTION: Creates a green rectangular region at (53, 101) spanning 37 by 114 pixels.
; PLAN: r0=53(x), r1=101(y), r2=37(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 101
LDI r2, 37
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
