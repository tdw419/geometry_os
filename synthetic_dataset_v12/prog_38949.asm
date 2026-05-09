; DESCRIPTION: Creates a red rectangular region at (323, 3) spanning 89 by 26 pixels.
; PLAN: r0=323(x), r1=3(y), r2=89(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 3
LDI r2, 89
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
