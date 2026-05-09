; DESCRIPTION: Creates a magenta rectangular region at (132, 58) spanning 83 by 84 pixels.
; PLAN: r0=132(x), r1=58(y), r2=83(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 58
LDI r2, 83
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
