; DESCRIPTION: Creates a magenta rectangular region at (18, 118) spanning 110 by 55 pixels.
; PLAN: r0=18(x), r1=118(y), r2=110(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 118
LDI r2, 110
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
