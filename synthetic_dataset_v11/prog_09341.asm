; DESCRIPTION: Creates a magenta rectangular region at (32, 88) spanning 92 by 60 pixels.
; PLAN: r0=32(x), r1=88(y), r2=92(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 88
LDI r2, 92
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
