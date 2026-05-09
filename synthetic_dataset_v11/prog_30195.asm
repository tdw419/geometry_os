; DESCRIPTION: Creates a magenta rectangular region at (161, 16) spanning 49 by 70 pixels.
; PLAN: r0=161(x), r1=16(y), r2=49(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 16
LDI r2, 49
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
