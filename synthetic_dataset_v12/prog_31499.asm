; DESCRIPTION: Creates a magenta rectangular region at (304, 68) spanning 63 by 35 pixels.
; PLAN: r0=304(x), r1=68(y), r2=63(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 68
LDI r2, 63
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
