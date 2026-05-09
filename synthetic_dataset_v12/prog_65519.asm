; DESCRIPTION: Creates a magenta rectangular region at (402, 102) spanning 49 by 23 pixels.
; PLAN: r0=402(x), r1=102(y), r2=49(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 102
LDI r2, 49
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
