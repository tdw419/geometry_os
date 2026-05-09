; DESCRIPTION: Creates a yellow rectangular region at (114, 81) spanning 20 by 83 pixels.
; PLAN: r0=114(x), r1=81(y), r2=20(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 81
LDI r2, 20
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
