; DESCRIPTION: Creates a magenta rectangular region at (75, 96) spanning 31 by 46 pixels.
; PLAN: r0=75(x), r1=96(y), r2=31(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 96
LDI r2, 31
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
