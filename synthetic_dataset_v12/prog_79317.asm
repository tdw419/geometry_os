; DESCRIPTION: Creates a magenta rectangular region at (64, 45) spanning 52 by 70 pixels.
; PLAN: r0=64(x), r1=45(y), r2=52(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 45
LDI r2, 52
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
