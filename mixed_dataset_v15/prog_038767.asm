; DESCRIPTION: Creates a magenta rectangular region at (127, 15) spanning 52 by 62 pixels.
; PLAN: r0=127(x), r1=15(y), r2=52(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 15
LDI r2, 52
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
