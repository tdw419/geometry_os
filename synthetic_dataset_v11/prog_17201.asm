; DESCRIPTION: Creates a magenta rectangular region at (45, 167) spanning 70 by 23 pixels.
; PLAN: r0=45(x), r1=167(y), r2=70(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 167
LDI r2, 70
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
