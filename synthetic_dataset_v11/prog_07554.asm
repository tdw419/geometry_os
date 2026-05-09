; DESCRIPTION: Creates a magenta rectangular region at (39, 57) spanning 99 by 32 pixels.
; PLAN: r0=39(x), r1=57(y), r2=99(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 57
LDI r2, 99
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
