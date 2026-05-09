; DESCRIPTION: Creates a magenta rectangular region at (327, 38) spanning 119 by 102 pixels.
; PLAN: r0=327(x), r1=38(y), r2=119(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 38
LDI r2, 119
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
