; DESCRIPTION: Creates a magenta rectangular region at (71, 5) spanning 71 by 73 pixels.
; PLAN: r0=71(x), r1=5(y), r2=71(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 5
LDI r2, 71
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
