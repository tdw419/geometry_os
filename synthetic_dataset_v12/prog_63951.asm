; DESCRIPTION: Creates a black rectangular region at (124, 155) spanning 102 by 98 pixels.
; PLAN: r0=124(x), r1=155(y), r2=102(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 155
LDI r2, 102
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
