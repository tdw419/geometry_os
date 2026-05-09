; DESCRIPTION: Creates a magenta rectangular region at (73, 70) spanning 112 by 33 pixels.
; PLAN: r0=73(x), r1=70(y), r2=112(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 70
LDI r2, 112
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
