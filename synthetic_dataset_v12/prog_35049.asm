; DESCRIPTION: Creates a magenta rectangular region at (222, 28) spanning 106 by 91 pixels.
; PLAN: r0=222(x), r1=28(y), r2=106(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 28
LDI r2, 106
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
