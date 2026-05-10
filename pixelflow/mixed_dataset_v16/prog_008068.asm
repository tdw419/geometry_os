; DESCRIPTION: Creates a yellow rectangular region at (311, 73) spanning 81 by 90 pixels.
; PLAN: r0=311(x), r1=73(y), r2=81(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 73
LDI r2, 81
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
