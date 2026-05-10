; DESCRIPTION: Creates a magenta rectangular region at (366, 194) spanning 71 by 61 pixels.
; PLAN: r0=366(x), r1=194(y), r2=71(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 194
LDI r2, 71
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
