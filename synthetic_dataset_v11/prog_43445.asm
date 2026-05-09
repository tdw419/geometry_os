; DESCRIPTION: Creates a magenta rectangular region at (219, 58) spanning 37 by 58 pixels.
; PLAN: r0=219(x), r1=58(y), r2=37(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 58
LDI r2, 37
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
