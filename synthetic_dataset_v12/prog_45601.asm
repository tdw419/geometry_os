; DESCRIPTION: Creates a magenta rectangular region at (44, 23) spanning 19 by 103 pixels.
; PLAN: r0=44(x), r1=23(y), r2=19(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 23
LDI r2, 19
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
