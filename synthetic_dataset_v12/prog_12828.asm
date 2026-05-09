; DESCRIPTION: Creates a magenta rectangular region at (142, 63) spanning 110 by 53 pixels.
; PLAN: r0=142(x), r1=63(y), r2=110(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 63
LDI r2, 110
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
