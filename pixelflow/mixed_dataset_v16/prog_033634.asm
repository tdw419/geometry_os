; DESCRIPTION: Creates a magenta rectangular region at (199, 18) spanning 65 by 119 pixels.
; PLAN: r0=199(x), r1=18(y), r2=65(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 18
LDI r2, 65
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
