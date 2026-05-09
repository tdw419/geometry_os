; DESCRIPTION: Creates a magenta rectangular region at (110, 50) spanning 69 by 108 pixels.
; PLAN: r0=110(x), r1=50(y), r2=69(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 50
LDI r2, 69
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
