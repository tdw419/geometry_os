; DESCRIPTION: Creates a magenta rectangular region at (40, 127) spanning 66 by 49 pixels.
; PLAN: r0=40(x), r1=127(y), r2=66(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 127
LDI r2, 66
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
