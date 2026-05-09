; DESCRIPTION: Creates a magenta rectangular region at (310, 170) spanning 11 by 85 pixels.
; PLAN: r0=310(x), r1=170(y), r2=11(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 170
LDI r2, 11
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
