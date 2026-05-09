; DESCRIPTION: Creates a magenta rectangular region at (81, 83) spanning 110 by 65 pixels.
; PLAN: r0=81(x), r1=83(y), r2=110(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 83
LDI r2, 110
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
