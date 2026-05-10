; DESCRIPTION: Creates a magenta rectangular region at (325, 81) spanning 100 by 81 pixels.
; PLAN: r0=325(x), r1=81(y), r2=100(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 81
LDI r2, 100
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
