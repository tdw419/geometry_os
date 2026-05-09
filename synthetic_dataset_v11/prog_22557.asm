; DESCRIPTION: Creates a magenta rectangular region at (92, 99) spanning 67 by 44 pixels.
; PLAN: r0=92(x), r1=99(y), r2=67(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 99
LDI r2, 67
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
