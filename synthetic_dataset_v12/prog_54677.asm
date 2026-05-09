; DESCRIPTION: Creates a yellow rectangular region at (282, 60) spanning 22 by 20 pixels.
; PLAN: r0=282(x), r1=60(y), r2=22(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 60
LDI r2, 22
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
