; DESCRIPTION: Creates a magenta rectangular region at (168, 100) spanning 35 by 96 pixels.
; PLAN: r0=168(x), r1=100(y), r2=35(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 100
LDI r2, 35
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
