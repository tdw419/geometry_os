; DESCRIPTION: Creates a red rectangular region at (323, 118) spanning 94 by 72 pixels.
; PLAN: r0=323(x), r1=118(y), r2=94(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 118
LDI r2, 94
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
