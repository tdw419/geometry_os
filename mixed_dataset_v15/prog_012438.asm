; DESCRIPTION: Creates a magenta rectangular region at (103, 212) spanning 87 by 11 pixels.
; PLAN: r0=103(x), r1=212(y), r2=87(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 212
LDI r2, 87
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
