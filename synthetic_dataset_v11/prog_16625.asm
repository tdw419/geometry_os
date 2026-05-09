; DESCRIPTION: Creates a magenta rectangular region at (32, 61) spanning 35 by 19 pixels.
; PLAN: r0=32(x), r1=61(y), r2=35(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 61
LDI r2, 35
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
