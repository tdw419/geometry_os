; DESCRIPTION: Creates a magenta rectangular region at (399, 133) spanning 75 by 71 pixels.
; PLAN: r0=399(x), r1=133(y), r2=75(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 133
LDI r2, 75
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
