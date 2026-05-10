; DESCRIPTION: Creates a magenta rectangular region at (265, 106) spanning 61 by 73 pixels.
; PLAN: r0=265(x), r1=106(y), r2=61(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 106
LDI r2, 61
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
