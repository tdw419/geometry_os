; DESCRIPTION: Creates a magenta rectangular region at (48, 23) spanning 22 by 76 pixels.
; PLAN: r0=48(x), r1=23(y), r2=22(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 23
LDI r2, 22
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
