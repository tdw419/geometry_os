; DESCRIPTION: Creates a magenta rectangular region at (96, 21) spanning 21 by 45 pixels.
; PLAN: r0=96(x), r1=21(y), r2=21(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 21
LDI r2, 21
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
