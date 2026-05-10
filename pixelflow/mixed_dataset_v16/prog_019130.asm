; DESCRIPTION: Creates a magenta rectangular region at (18, 132) spanning 119 by 16 pixels.
; PLAN: r0=18(x), r1=132(y), r2=119(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 132
LDI r2, 119
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
