; DESCRIPTION: Creates a red rectangular region at (457, 118) spanning 29 by 46 pixels.
; PLAN: r0=457(x), r1=118(y), r2=29(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 118
LDI r2, 29
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
