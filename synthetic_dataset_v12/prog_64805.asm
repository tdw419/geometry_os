; DESCRIPTION: Creates a magenta rectangular region at (109, 80) spanning 49 by 44 pixels.
; PLAN: r0=109(x), r1=80(y), r2=49(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 80
LDI r2, 49
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
