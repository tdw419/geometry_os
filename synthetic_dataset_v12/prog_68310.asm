; DESCRIPTION: Creates a magenta rectangular region at (131, 72) spanning 103 by 99 pixels.
; PLAN: r0=131(x), r1=72(y), r2=103(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 72
LDI r2, 103
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
