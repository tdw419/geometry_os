; DESCRIPTION: Creates a magenta rectangular region at (454, 162) spanning 18 by 83 pixels.
; PLAN: r0=454(x), r1=162(y), r2=18(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 162
LDI r2, 18
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
