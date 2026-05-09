; DESCRIPTION: Creates a magenta rectangular region at (139, 170) spanning 103 by 44 pixels.
; PLAN: r0=139(x), r1=170(y), r2=103(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 170
LDI r2, 103
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
