; DESCRIPTION: Creates a magenta rectangular region at (66, 52) spanning 114 by 55 pixels.
; PLAN: r0=66(x), r1=52(y), r2=114(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 52
LDI r2, 114
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
