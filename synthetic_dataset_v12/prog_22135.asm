; DESCRIPTION: Creates a magenta rectangular region at (139, 96) spanning 102 by 13 pixels.
; PLAN: r0=139(x), r1=96(y), r2=102(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 96
LDI r2, 102
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
