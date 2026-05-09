; DESCRIPTION: Creates a magenta rectangular region at (160, 66) spanning 60 by 97 pixels.
; PLAN: r0=160(x), r1=66(y), r2=60(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 66
LDI r2, 60
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
