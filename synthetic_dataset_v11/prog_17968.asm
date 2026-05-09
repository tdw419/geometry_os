; DESCRIPTION: Creates a magenta rectangular region at (59, 119) spanning 20 by 71 pixels.
; PLAN: r0=59(x), r1=119(y), r2=20(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 119
LDI r2, 20
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
