; DESCRIPTION: Creates a magenta rectangular region at (371, 17) spanning 66 by 73 pixels.
; PLAN: r0=371(x), r1=17(y), r2=66(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 17
LDI r2, 66
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
