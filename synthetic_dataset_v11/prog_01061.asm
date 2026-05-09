; DESCRIPTION: Creates a magenta rectangular region at (74, 229) spanning 65 by 20 pixels.
; PLAN: r0=74(x), r1=229(y), r2=65(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 229
LDI r2, 65
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
