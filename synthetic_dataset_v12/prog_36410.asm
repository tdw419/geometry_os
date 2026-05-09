; DESCRIPTION: Creates a magenta rectangular region at (25, 79) spanning 24 by 101 pixels.
; PLAN: r0=25(x), r1=79(y), r2=24(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 79
LDI r2, 24
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
