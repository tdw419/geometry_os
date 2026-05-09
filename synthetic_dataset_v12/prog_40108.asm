; DESCRIPTION: Creates a red rectangular region at (351, 75) spanning 68 by 58 pixels.
; PLAN: r0=351(x), r1=75(y), r2=68(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 75
LDI r2, 68
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
