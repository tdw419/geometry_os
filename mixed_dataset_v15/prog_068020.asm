; DESCRIPTION: Creates a magenta rectangular region at (38, 233) spanning 20 by 13 pixels.
; PLAN: r0=38(x), r1=233(y), r2=20(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 233
LDI r2, 20
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
