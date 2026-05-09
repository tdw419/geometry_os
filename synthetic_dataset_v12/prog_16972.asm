; DESCRIPTION: Creates a yellow rectangular region at (233, 204) spanning 100 by 14 pixels.
; PLAN: r0=233(x), r1=204(y), r2=100(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 204
LDI r2, 100
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
