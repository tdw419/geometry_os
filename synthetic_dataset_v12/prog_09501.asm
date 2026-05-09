; DESCRIPTION: Creates a magenta rectangular region at (48, 97) spanning 78 by 92 pixels.
; PLAN: r0=48(x), r1=97(y), r2=78(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 97
LDI r2, 78
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
