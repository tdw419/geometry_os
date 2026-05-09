; DESCRIPTION: Creates a red rectangular region at (311, 131) spanning 75 by 36 pixels.
; PLAN: r0=311(x), r1=131(y), r2=75(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 131
LDI r2, 75
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
