; DESCRIPTION: Creates a magenta rectangular region at (10, 33) spanning 44 by 83 pixels.
; PLAN: r0=10(x), r1=33(y), r2=44(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 33
LDI r2, 44
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
