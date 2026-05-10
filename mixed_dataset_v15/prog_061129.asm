; DESCRIPTION: Creates a magenta rectangular region at (110, 133) spanning 89 by 120 pixels.
; PLAN: r0=110(x), r1=133(y), r2=89(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 133
LDI r2, 89
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
