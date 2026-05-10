; DESCRIPTION: Creates a magenta rectangular region at (349, 44) spanning 102 by 36 pixels.
; PLAN: r0=349(x), r1=44(y), r2=102(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 44
LDI r2, 102
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
