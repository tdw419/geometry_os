; DESCRIPTION: Creates a magenta rectangular region at (273, 70) spanning 70 by 95 pixels.
; PLAN: r0=273(x), r1=70(y), r2=70(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 70
LDI r2, 70
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
