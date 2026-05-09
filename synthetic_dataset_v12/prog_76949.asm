; DESCRIPTION: Creates a white rectangular region at (311, 154) spanning 100 by 94 pixels.
; PLAN: r0=311(x), r1=154(y), r2=100(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 154
LDI r2, 100
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
