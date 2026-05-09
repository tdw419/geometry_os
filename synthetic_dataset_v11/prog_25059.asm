; DESCRIPTION: Creates a magenta rectangular region at (0, 160) spanning 103 by 92 pixels.
; PLAN: r0=0(x), r1=160(y), r2=103(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 160
LDI r2, 103
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
