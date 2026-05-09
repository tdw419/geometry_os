; DESCRIPTION: Creates a yellow rectangular region at (62, 70) spanning 38 by 60 pixels.
; PLAN: r0=62(x), r1=70(y), r2=38(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 70
LDI r2, 38
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
