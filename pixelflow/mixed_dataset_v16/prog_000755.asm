; DESCRIPTION: Creates a red rectangular region at (253, 118) spanning 84 by 20 pixels.
; PLAN: r0=253(x), r1=118(y), r2=84(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 118
LDI r2, 84
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
