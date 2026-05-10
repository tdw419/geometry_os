; DESCRIPTION: Creates a magenta rectangular region at (395, 90) spanning 37 by 72 pixels.
; PLAN: r0=395(x), r1=90(y), r2=37(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 90
LDI r2, 37
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
