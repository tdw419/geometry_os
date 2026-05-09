; DESCRIPTION: Creates a yellow rectangular region at (372, 31) spanning 13 by 94 pixels.
; PLAN: r0=372(x), r1=31(y), r2=13(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 31
LDI r2, 13
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
