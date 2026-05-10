; DESCRIPTION: Creates a magenta rectangular region at (70, 1) spanning 61 by 32 pixels.
; PLAN: r0=70(x), r1=1(y), r2=61(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 1
LDI r2, 61
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
