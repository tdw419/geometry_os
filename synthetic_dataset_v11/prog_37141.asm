; DESCRIPTION: Creates a magenta rectangular region at (159, 81) spanning 74 by 96 pixels.
; PLAN: r0=159(x), r1=81(y), r2=74(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 81
LDI r2, 74
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
