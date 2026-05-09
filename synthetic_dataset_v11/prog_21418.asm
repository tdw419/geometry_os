; DESCRIPTION: Creates a magenta rectangular region at (116, 51) spanning 32 by 115 pixels.
; PLAN: r0=116(x), r1=51(y), r2=32(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 51
LDI r2, 32
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
