; DESCRIPTION: Creates a yellow rectangular region at (91, 74) spanning 110 by 31 pixels.
; PLAN: r0=91(x), r1=74(y), r2=110(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 74
LDI r2, 110
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
