; DESCRIPTION: Creates a yellow rectangular region at (205, 188) spanning 108 by 55 pixels.
; PLAN: r0=205(x), r1=188(y), r2=108(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 188
LDI r2, 108
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
