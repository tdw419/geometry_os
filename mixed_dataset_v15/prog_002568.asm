; DESCRIPTION: Creates a yellow rectangular region at (36, 109) spanning 110 by 65 pixels.
; PLAN: r0=36(x), r1=109(y), r2=110(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 109
LDI r2, 110
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
