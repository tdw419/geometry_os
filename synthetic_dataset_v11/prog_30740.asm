; DESCRIPTION: Creates a magenta rectangular region at (210, 3) spanning 34 by 110 pixels.
; PLAN: r0=210(x), r1=3(y), r2=34(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 3
LDI r2, 34
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
