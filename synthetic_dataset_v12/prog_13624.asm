; DESCRIPTION: Creates a white rectangular region at (311, 95) spanning 92 by 96 pixels.
; PLAN: r0=311(x), r1=95(y), r2=92(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 95
LDI r2, 92
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
