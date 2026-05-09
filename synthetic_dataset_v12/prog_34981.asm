; DESCRIPTION: Creates a magenta rectangular region at (195, 132) spanning 54 by 84 pixels.
; PLAN: r0=195(x), r1=132(y), r2=54(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 132
LDI r2, 54
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
