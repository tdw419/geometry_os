; DESCRIPTION: Creates a magenta rectangular region at (390, 159) spanning 76 by 33 pixels.
; PLAN: r0=390(x), r1=159(y), r2=76(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 159
LDI r2, 76
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
