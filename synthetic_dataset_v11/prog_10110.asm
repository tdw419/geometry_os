; DESCRIPTION: Creates a magenta rectangular region at (20, 125) spanning 85 by 110 pixels.
; PLAN: r0=20(x), r1=125(y), r2=85(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 125
LDI r2, 85
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
