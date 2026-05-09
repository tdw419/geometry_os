; DESCRIPTION: Creates a yellow rectangular region at (388, 45) spanning 25 by 108 pixels.
; PLAN: r0=388(x), r1=45(y), r2=25(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 45
LDI r2, 25
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
