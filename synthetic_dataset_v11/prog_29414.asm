; DESCRIPTION: Creates a magenta rectangular region at (3, 161) spanning 40 by 44 pixels.
; PLAN: r0=3(x), r1=161(y), r2=40(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 161
LDI r2, 40
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
