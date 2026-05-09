; DESCRIPTION: Creates a magenta rectangular region at (23, 34) spanning 64 by 90 pixels.
; PLAN: r0=23(x), r1=34(y), r2=64(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 34
LDI r2, 64
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
