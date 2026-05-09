; DESCRIPTION: Creates a magenta rectangular region at (17, 145) spanning 106 by 67 pixels.
; PLAN: r0=17(x), r1=145(y), r2=106(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 145
LDI r2, 106
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
