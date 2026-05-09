; DESCRIPTION: Creates a magenta rectangular region at (99, 57) spanning 86 by 49 pixels.
; PLAN: r0=99(x), r1=57(y), r2=86(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 57
LDI r2, 86
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
