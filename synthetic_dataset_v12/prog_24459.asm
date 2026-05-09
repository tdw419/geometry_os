; DESCRIPTION: Creates a magenta rectangular region at (37, 23) spanning 103 by 21 pixels.
; PLAN: r0=37(x), r1=23(y), r2=103(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 23
LDI r2, 103
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
