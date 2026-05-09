; DESCRIPTION: Creates a magenta rectangular region at (199, 96) spanning 19 by 85 pixels.
; PLAN: r0=199(x), r1=96(y), r2=19(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 96
LDI r2, 19
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
