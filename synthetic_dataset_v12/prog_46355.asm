; DESCRIPTION: Creates a magenta rectangular region at (163, 14) spanning 90 by 105 pixels.
; PLAN: r0=163(x), r1=14(y), r2=90(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 14
LDI r2, 90
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
