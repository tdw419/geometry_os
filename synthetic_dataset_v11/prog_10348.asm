; DESCRIPTION: Creates a magenta rectangular region at (26, 21) spanning 21 by 112 pixels.
; PLAN: r0=26(x), r1=21(y), r2=21(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 21
LDI r2, 21
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
