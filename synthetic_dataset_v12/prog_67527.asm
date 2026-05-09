; DESCRIPTION: Creates a magenta rectangular region at (360, 53) spanning 51 by 115 pixels.
; PLAN: r0=360(x), r1=53(y), r2=51(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 53
LDI r2, 51
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
