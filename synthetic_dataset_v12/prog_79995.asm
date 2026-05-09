; DESCRIPTION: Creates a yellow rectangular region at (233, 81) spanning 102 by 117 pixels.
; PLAN: r0=233(x), r1=81(y), r2=102(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 81
LDI r2, 102
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
