; DESCRIPTION: Creates a magenta rectangular region at (276, 52) spanning 25 by 38 pixels.
; PLAN: r0=276(x), r1=52(y), r2=25(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 52
LDI r2, 25
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
