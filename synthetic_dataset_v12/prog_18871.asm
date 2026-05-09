; DESCRIPTION: Creates a magenta rectangular region at (45, 136) spanning 98 by 108 pixels.
; PLAN: r0=45(x), r1=136(y), r2=98(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 136
LDI r2, 98
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
