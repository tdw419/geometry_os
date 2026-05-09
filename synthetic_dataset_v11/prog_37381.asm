; DESCRIPTION: Creates a red rectangular region at (16, 97) spanning 66 by 118 pixels.
; PLAN: r0=16(x), r1=97(y), r2=66(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 97
LDI r2, 66
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
