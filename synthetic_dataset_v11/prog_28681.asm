; DESCRIPTION: Creates a magenta rectangular region at (61, 127) spanning 106 by 26 pixels.
; PLAN: r0=61(x), r1=127(y), r2=106(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 127
LDI r2, 106
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
