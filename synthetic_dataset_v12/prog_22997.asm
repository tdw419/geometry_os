; DESCRIPTION: Creates a magenta rectangular region at (30, 119) spanning 47 by 71 pixels.
; PLAN: r0=30(x), r1=119(y), r2=47(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 119
LDI r2, 47
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
