; DESCRIPTION: Creates a magenta rectangular region at (75, 4) spanning 97 by 105 pixels.
; PLAN: r0=75(x), r1=4(y), r2=97(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 4
LDI r2, 97
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
