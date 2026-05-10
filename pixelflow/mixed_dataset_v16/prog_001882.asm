; DESCRIPTION: Creates a magenta rectangular region at (109, 208) spanning 75 by 26 pixels.
; PLAN: r0=109(x), r1=208(y), r2=75(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 208
LDI r2, 75
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
