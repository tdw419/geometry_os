; DESCRIPTION: Creates a yellow rectangular region at (142, 229) spanning 69 by 17 pixels.
; PLAN: r0=142(x), r1=229(y), r2=69(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 229
LDI r2, 69
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
