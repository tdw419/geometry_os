; DESCRIPTION: Creates a magenta rectangular region at (280, 139) spanning 66 by 101 pixels.
; PLAN: r0=280(x), r1=139(y), r2=66(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 139
LDI r2, 66
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
