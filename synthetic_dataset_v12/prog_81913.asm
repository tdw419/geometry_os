; DESCRIPTION: Creates a magenta rectangular region at (220, 70) spanning 96 by 73 pixels.
; PLAN: r0=220(x), r1=70(y), r2=96(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 70
LDI r2, 96
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
