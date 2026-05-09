; DESCRIPTION: Creates a magenta rectangular region at (20, 78) spanning 88 by 10 pixels.
; PLAN: r0=20(x), r1=78(y), r2=88(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 78
LDI r2, 88
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
