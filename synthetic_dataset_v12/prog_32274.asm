; DESCRIPTION: Creates a magenta rectangular region at (314, 76) spanning 54 by 61 pixels.
; PLAN: r0=314(x), r1=76(y), r2=54(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 76
LDI r2, 54
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
