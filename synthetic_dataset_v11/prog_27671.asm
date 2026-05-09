; DESCRIPTION: Creates a magenta rectangular region at (22, 139) spanning 87 by 40 pixels.
; PLAN: r0=22(x), r1=139(y), r2=87(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 139
LDI r2, 87
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
