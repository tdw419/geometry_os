; DESCRIPTION: Creates a magenta rectangular region at (75, 16) spanning 27 by 106 pixels.
; PLAN: r0=75(x), r1=16(y), r2=27(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 16
LDI r2, 27
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
