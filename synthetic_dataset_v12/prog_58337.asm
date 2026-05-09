; DESCRIPTION: Creates a magenta rectangular region at (13, 45) spanning 56 by 103 pixels.
; PLAN: r0=13(x), r1=45(y), r2=56(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 45
LDI r2, 56
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
