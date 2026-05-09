; DESCRIPTION: Creates a magenta rectangular region at (0, 123) spanning 38 by 120 pixels.
; PLAN: r0=0(x), r1=123(y), r2=38(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 123
LDI r2, 38
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
