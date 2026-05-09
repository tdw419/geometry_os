; DESCRIPTION: Creates a magenta rectangular region at (144, 170) spanning 64 by 26 pixels.
; PLAN: r0=144(x), r1=170(y), r2=64(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 170
LDI r2, 64
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
