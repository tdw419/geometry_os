; DESCRIPTION: Creates a magenta rectangular region at (8, 170) spanning 72 by 76 pixels.
; PLAN: r0=8(x), r1=170(y), r2=72(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 170
LDI r2, 72
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
