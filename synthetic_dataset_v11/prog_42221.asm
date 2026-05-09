; DESCRIPTION: Creates a magenta rectangular region at (124, 121) spanning 98 by 89 pixels.
; PLAN: r0=124(x), r1=121(y), r2=98(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 121
LDI r2, 98
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
