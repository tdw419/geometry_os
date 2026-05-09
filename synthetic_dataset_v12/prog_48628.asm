; DESCRIPTION: Creates a yellow rectangular region at (153, 38) spanning 30 by 119 pixels.
; PLAN: r0=153(x), r1=38(y), r2=30(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 38
LDI r2, 30
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
