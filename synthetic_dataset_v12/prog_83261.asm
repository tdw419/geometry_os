; DESCRIPTION: Creates a magenta rectangular region at (113, 217) spanning 36 by 23 pixels.
; PLAN: r0=113(x), r1=217(y), r2=36(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 217
LDI r2, 36
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
