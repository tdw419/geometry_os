; DESCRIPTION: Creates a magenta rectangular region at (172, 75) spanning 89 by 50 pixels.
; PLAN: r0=172(x), r1=75(y), r2=89(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 75
LDI r2, 89
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
