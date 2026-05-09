; DESCRIPTION: Creates a magenta rectangular region at (345, 136) spanning 97 by 91 pixels.
; PLAN: r0=345(x), r1=136(y), r2=97(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 136
LDI r2, 97
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
