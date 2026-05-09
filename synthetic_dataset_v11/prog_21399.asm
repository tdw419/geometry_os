; DESCRIPTION: Creates a magenta rectangular region at (57, 121) spanning 97 by 65 pixels.
; PLAN: r0=57(x), r1=121(y), r2=97(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 121
LDI r2, 97
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
