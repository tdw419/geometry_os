; DESCRIPTION: Creates a magenta rectangular region at (31, 11) spanning 45 by 52 pixels.
; PLAN: r0=31(x), r1=11(y), r2=45(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 11
LDI r2, 45
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
