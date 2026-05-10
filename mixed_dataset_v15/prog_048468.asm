; DESCRIPTION: Creates a magenta rectangular region at (133, 103) spanning 28 by 81 pixels.
; PLAN: r0=133(x), r1=103(y), r2=28(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 103
LDI r2, 28
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
