; DESCRIPTION: Creates a magenta rectangular region at (302, 84) spanning 95 by 87 pixels.
; PLAN: r0=302(x), r1=84(y), r2=95(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 84
LDI r2, 95
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
