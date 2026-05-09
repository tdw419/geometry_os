; DESCRIPTION: Creates a magenta rectangular region at (332, 10) spanning 29 by 49 pixels.
; PLAN: r0=332(x), r1=10(y), r2=29(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 10
LDI r2, 29
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
