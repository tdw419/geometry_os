; DESCRIPTION: Creates a magenta rectangular region at (177, 16) spanning 78 by 53 pixels.
; PLAN: r0=177(x), r1=16(y), r2=78(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 16
LDI r2, 78
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
