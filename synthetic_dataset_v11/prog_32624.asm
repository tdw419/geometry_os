; DESCRIPTION: Creates a magenta rectangular region at (79, 132) spanning 111 by 83 pixels.
; PLAN: r0=79(x), r1=132(y), r2=111(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 132
LDI r2, 111
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
