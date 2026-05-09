; DESCRIPTION: Creates a magenta rectangular region at (30, 49) spanning 46 by 115 pixels.
; PLAN: r0=30(x), r1=49(y), r2=46(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 49
LDI r2, 46
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
