; DESCRIPTION: Creates a yellow rectangular region at (241, 31) spanning 17 by 35 pixels.
; PLAN: r0=241(x), r1=31(y), r2=17(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 31
LDI r2, 17
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
