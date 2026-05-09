; DESCRIPTION: Creates a magenta rectangular region at (367, 144) spanning 106 by 102 pixels.
; PLAN: r0=367(x), r1=144(y), r2=106(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 144
LDI r2, 106
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
