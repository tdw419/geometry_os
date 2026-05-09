; DESCRIPTION: Creates a magenta rectangular region at (81, 138) spanning 105 by 52 pixels.
; PLAN: r0=81(x), r1=138(y), r2=105(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 138
LDI r2, 105
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
