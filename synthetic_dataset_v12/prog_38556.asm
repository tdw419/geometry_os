; DESCRIPTION: Creates a magenta rectangular region at (176, 75) spanning 11 by 115 pixels.
; PLAN: r0=176(x), r1=75(y), r2=11(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 75
LDI r2, 11
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
