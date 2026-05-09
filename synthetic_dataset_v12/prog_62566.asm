; DESCRIPTION: Creates a magenta rectangular region at (407, 17) spanning 76 by 20 pixels.
; PLAN: r0=407(x), r1=17(y), r2=76(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 17
LDI r2, 76
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
