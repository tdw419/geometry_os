; DESCRIPTION: Creates a magenta rectangular region at (240, 45) spanning 69 by 52 pixels.
; PLAN: r0=240(x), r1=45(y), r2=69(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 45
LDI r2, 69
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
