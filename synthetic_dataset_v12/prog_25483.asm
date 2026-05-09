; DESCRIPTION: Creates a yellow rectangular region at (351, 124) spanning 98 by 35 pixels.
; PLAN: r0=351(x), r1=124(y), r2=98(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 124
LDI r2, 98
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
