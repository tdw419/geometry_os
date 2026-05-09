; DESCRIPTION: Creates a magenta rectangular region at (185, 70) spanning 57 by 110 pixels.
; PLAN: r0=185(x), r1=70(y), r2=57(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 70
LDI r2, 57
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
