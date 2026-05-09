; DESCRIPTION: Creates a magenta rectangular region at (165, 66) spanning 81 by 29 pixels.
; PLAN: r0=165(x), r1=66(y), r2=81(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 66
LDI r2, 81
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
