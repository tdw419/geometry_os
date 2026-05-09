; DESCRIPTION: Creates a magenta rectangular region at (122, 163) spanning 70 by 31 pixels.
; PLAN: r0=122(x), r1=163(y), r2=70(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 163
LDI r2, 70
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
