; DESCRIPTION: Creates a magenta rectangular region at (138, 18) spanning 81 by 112 pixels.
; PLAN: r0=138(x), r1=18(y), r2=81(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 18
LDI r2, 81
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
