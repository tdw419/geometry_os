; DESCRIPTION: Creates a magenta rectangular region at (118, 220) spanning 81 by 34 pixels.
; PLAN: r0=118(x), r1=220(y), r2=81(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 220
LDI r2, 81
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
