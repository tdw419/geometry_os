; DESCRIPTION: Creates a yellow rectangular region at (192, 207) spanning 110 by 29 pixels.
; PLAN: r0=192(x), r1=207(y), r2=110(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 207
LDI r2, 110
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
