; DESCRIPTION: Creates a magenta rectangular region at (250, 68) spanning 57 by 19 pixels.
; PLAN: r0=250(x), r1=68(y), r2=57(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 68
LDI r2, 57
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
