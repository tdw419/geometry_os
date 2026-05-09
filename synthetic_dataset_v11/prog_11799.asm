; DESCRIPTION: Creates a yellow rectangular region at (25, 47) spanning 118 by 119 pixels.
; PLAN: r0=25(x), r1=47(y), r2=118(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 47
LDI r2, 118
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
