; DESCRIPTION: Creates a magenta rectangular region at (45, 54) spanning 117 by 88 pixels.
; PLAN: r0=45(x), r1=54(y), r2=117(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 54
LDI r2, 117
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
