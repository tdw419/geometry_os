; DESCRIPTION: Creates a magenta rectangular region at (279, 63) spanning 80 by 105 pixels.
; PLAN: r0=279(x), r1=63(y), r2=80(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 63
LDI r2, 80
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
