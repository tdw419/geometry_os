; DESCRIPTION: Creates a magenta rectangular region at (139, 0) spanning 83 by 49 pixels.
; PLAN: r0=139(x), r1=0(y), r2=83(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 0
LDI r2, 83
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
