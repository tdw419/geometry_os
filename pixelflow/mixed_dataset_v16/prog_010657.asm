; DESCRIPTION: Creates a magenta rectangular region at (36, 133) spanning 66 by 10 pixels.
; PLAN: r0=36(x), r1=133(y), r2=66(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 133
LDI r2, 66
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
