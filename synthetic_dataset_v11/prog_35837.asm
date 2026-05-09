; DESCRIPTION: Creates a magenta rectangular region at (175, 68) spanning 44 by 73 pixels.
; PLAN: r0=175(x), r1=68(y), r2=44(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 68
LDI r2, 44
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
