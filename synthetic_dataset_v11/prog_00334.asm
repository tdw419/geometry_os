; DESCRIPTION: Creates a magenta rectangular region at (162, 136) spanning 87 by 45 pixels.
; PLAN: r0=162(x), r1=136(y), r2=87(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 136
LDI r2, 87
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
