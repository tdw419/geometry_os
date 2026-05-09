; DESCRIPTION: Creates a magenta rectangular region at (178, 22) spanning 78 by 45 pixels.
; PLAN: r0=178(x), r1=22(y), r2=78(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 22
LDI r2, 78
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
