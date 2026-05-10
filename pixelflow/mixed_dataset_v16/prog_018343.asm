; DESCRIPTION: Creates a magenta rectangular region at (359, 142) spanning 15 by 64 pixels.
; PLAN: r0=359(x), r1=142(y), r2=15(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 142
LDI r2, 15
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
