; DESCRIPTION: Creates a magenta rectangular region at (84, 86) spanning 66 by 16 pixels.
; PLAN: r0=84(x), r1=86(y), r2=66(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 86
LDI r2, 66
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
