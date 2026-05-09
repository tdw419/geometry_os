; DESCRIPTION: Creates a magenta rectangular region at (260, 101) spanning 92 by 75 pixels.
; PLAN: r0=260(x), r1=101(y), r2=92(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 101
LDI r2, 92
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
