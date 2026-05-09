; DESCRIPTION: Creates a yellow rectangular region at (16, 45) spanning 108 by 38 pixels.
; PLAN: r0=16(x), r1=45(y), r2=108(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 45
LDI r2, 108
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
