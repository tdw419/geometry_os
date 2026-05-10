; DESCRIPTION: Creates a magenta rectangular region at (91, 145) spanning 115 by 99 pixels.
; PLAN: r0=91(x), r1=145(y), r2=115(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 145
LDI r2, 115
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
