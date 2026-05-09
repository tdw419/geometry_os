; DESCRIPTION: Creates a yellow rectangular region at (29, 14) spanning 110 by 16 pixels.
; PLAN: r0=29(x), r1=14(y), r2=110(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 14
LDI r2, 110
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
