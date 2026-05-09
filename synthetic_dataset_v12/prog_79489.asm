; DESCRIPTION: Creates a magenta rectangular region at (34, 132) spanning 71 by 40 pixels.
; PLAN: r0=34(x), r1=132(y), r2=71(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 132
LDI r2, 71
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
