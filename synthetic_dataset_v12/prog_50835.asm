; DESCRIPTION: Creates a magenta rectangular region at (9, 39) spanning 23 by 64 pixels.
; PLAN: r0=9(x), r1=39(y), r2=23(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 39
LDI r2, 23
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
