; DESCRIPTION: Creates a magenta rectangular region at (323, 200) spanning 22 by 33 pixels.
; PLAN: r0=323(x), r1=200(y), r2=22(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 200
LDI r2, 22
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
