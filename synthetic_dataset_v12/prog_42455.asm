; DESCRIPTION: Creates a magenta rectangular region at (89, 31) spanning 100 by 113 pixels.
; PLAN: r0=89(x), r1=31(y), r2=100(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 31
LDI r2, 100
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
