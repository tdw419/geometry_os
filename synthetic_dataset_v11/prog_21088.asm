; DESCRIPTION: Creates a magenta rectangular region at (22, 0) spanning 115 by 10 pixels.
; PLAN: r0=22(x), r1=0(y), r2=115(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 0
LDI r2, 115
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
