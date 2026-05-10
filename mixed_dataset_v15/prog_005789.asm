; DESCRIPTION: Creates a magenta rectangular region at (254, 100) spanning 28 by 94 pixels.
; PLAN: r0=254(x), r1=100(y), r2=28(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 100
LDI r2, 28
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
