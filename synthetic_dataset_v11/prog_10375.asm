; DESCRIPTION: Creates a magenta rectangular region at (62, 166) spanning 92 by 62 pixels.
; PLAN: r0=62(x), r1=166(y), r2=92(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 166
LDI r2, 92
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
