; DESCRIPTION: Creates a magenta rectangular region at (81, 146) spanning 116 by 89 pixels.
; PLAN: r0=81(x), r1=146(y), r2=116(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 146
LDI r2, 116
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
