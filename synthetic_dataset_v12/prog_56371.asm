; DESCRIPTION: Creates a red rectangular region at (311, 62) spanning 87 by 80 pixels.
; PLAN: r0=311(x), r1=62(y), r2=87(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 62
LDI r2, 87
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
