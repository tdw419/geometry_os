; DESCRIPTION: Creates a magenta rectangular region at (77, 69) spanning 38 by 63 pixels.
; PLAN: r0=77(x), r1=69(y), r2=38(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 69
LDI r2, 38
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
