; DESCRIPTION: Creates a magenta rectangular region at (251, 77) spanning 36 by 75 pixels.
; PLAN: r0=251(x), r1=77(y), r2=36(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 77
LDI r2, 36
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
