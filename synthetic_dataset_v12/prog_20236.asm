; DESCRIPTION: Creates a magenta rectangular region at (75, 49) spanning 105 by 27 pixels.
; PLAN: r0=75(x), r1=49(y), r2=105(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 49
LDI r2, 105
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
