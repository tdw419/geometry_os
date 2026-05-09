; DESCRIPTION: Creates a magenta rectangular region at (222, 198) spanning 49 by 47 pixels.
; PLAN: r0=222(x), r1=198(y), r2=49(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 198
LDI r2, 49
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
