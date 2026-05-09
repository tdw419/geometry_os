; DESCRIPTION: Creates a magenta rectangular region at (444, 115) spanning 10 by 66 pixels.
; PLAN: r0=444(x), r1=115(y), r2=10(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 115
LDI r2, 10
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
