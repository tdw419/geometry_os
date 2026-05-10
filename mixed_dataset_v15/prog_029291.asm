; DESCRIPTION: Creates a red rectangular region at (311, 76) spanning 83 by 83 pixels.
; PLAN: r0=311(x), r1=76(y), r2=83(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 76
LDI r2, 83
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
