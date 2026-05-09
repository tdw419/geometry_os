; DESCRIPTION: Creates a yellow rectangular region at (58, 198) spanning 65 by 17 pixels.
; PLAN: r0=58(x), r1=198(y), r2=65(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 198
LDI r2, 65
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
