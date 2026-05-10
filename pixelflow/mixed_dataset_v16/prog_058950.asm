; DESCRIPTION: Creates a magenta rectangular region at (15, 38) spanning 83 by 58 pixels.
; PLAN: r0=15(x), r1=38(y), r2=83(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 38
LDI r2, 83
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
