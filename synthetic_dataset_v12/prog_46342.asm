; DESCRIPTION: Creates a magenta rectangular region at (188, 40) spanning 74 by 55 pixels.
; PLAN: r0=188(x), r1=40(y), r2=74(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 40
LDI r2, 74
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
