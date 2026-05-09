; DESCRIPTION: Creates a magenta rectangular region at (120, 68) spanning 38 by 51 pixels.
; PLAN: r0=120(x), r1=68(y), r2=38(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 68
LDI r2, 38
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
