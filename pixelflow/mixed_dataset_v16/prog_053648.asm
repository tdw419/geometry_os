; DESCRIPTION: Creates a magenta rectangular region at (37, 161) spanning 35 by 80 pixels.
; PLAN: r0=37(x), r1=161(y), r2=35(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 161
LDI r2, 35
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
