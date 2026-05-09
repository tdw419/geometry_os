; DESCRIPTION: Creates a magenta rectangular region at (115, 35) spanning 117 by 92 pixels.
; PLAN: r0=115(x), r1=35(y), r2=117(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 35
LDI r2, 117
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
