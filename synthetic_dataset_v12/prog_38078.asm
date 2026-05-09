; DESCRIPTION: Creates a magenta rectangular region at (357, 109) spanning 106 by 91 pixels.
; PLAN: r0=357(x), r1=109(y), r2=106(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 109
LDI r2, 106
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
