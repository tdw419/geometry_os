; DESCRIPTION: Creates a magenta rectangular region at (163, 189) spanning 13 by 65 pixels.
; PLAN: r0=163(x), r1=189(y), r2=13(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 189
LDI r2, 13
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
