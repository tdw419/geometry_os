; DESCRIPTION: Creates a magenta rectangular region at (199, 105) spanning 87 by 60 pixels.
; PLAN: r0=199(x), r1=105(y), r2=87(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 105
LDI r2, 87
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
