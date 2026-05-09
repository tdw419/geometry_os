; DESCRIPTION: Creates a magenta rectangular region at (3, 44) spanning 52 by 26 pixels.
; PLAN: r0=3(x), r1=44(y), r2=52(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 44
LDI r2, 52
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
