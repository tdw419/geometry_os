; DESCRIPTION: Creates a white rectangular region at (311, 120) spanning 101 by 87 pixels.
; PLAN: r0=311(x), r1=120(y), r2=101(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 120
LDI r2, 101
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
