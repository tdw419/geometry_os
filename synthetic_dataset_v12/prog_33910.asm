; DESCRIPTION: Creates a magenta rectangular region at (28, 86) spanning 12 by 99 pixels.
; PLAN: r0=28(x), r1=86(y), r2=12(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 86
LDI r2, 12
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
