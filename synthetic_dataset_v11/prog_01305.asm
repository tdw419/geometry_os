; DESCRIPTION: Creates a green rectangular region at (90, 101) spanning 105 by 102 pixels.
; PLAN: r0=90(x), r1=101(y), r2=105(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 101
LDI r2, 105
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
