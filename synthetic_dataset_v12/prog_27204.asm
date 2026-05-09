; DESCRIPTION: Creates a magenta rectangular region at (457, 80) spanning 52 by 109 pixels.
; PLAN: r0=457(x), r1=80(y), r2=52(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 80
LDI r2, 52
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
