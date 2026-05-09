; DESCRIPTION: Creates a magenta rectangular region at (285, 85) spanning 15 by 24 pixels.
; PLAN: r0=285(x), r1=85(y), r2=15(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 85
LDI r2, 15
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
