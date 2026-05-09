; DESCRIPTION: Creates a magenta rectangular region at (89, 108) spanning 50 by 19 pixels.
; PLAN: r0=89(x), r1=108(y), r2=50(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 108
LDI r2, 50
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
