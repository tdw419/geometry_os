; DESCRIPTION: Creates a green rectangular region at (139, 92) spanning 118 by 39 pixels.
; PLAN: r0=139(x), r1=92(y), r2=118(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 92
LDI r2, 118
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
