; DESCRIPTION: Creates a yellow rectangular region at (264, 118) spanning 115 by 36 pixels.
; PLAN: r0=264(x), r1=118(y), r2=115(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 118
LDI r2, 115
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
