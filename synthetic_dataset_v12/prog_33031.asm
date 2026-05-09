; DESCRIPTION: Creates a magenta rectangular region at (73, 55) spanning 96 by 60 pixels.
; PLAN: r0=73(x), r1=55(y), r2=96(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 55
LDI r2, 96
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
