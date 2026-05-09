; DESCRIPTION: Creates a magenta rectangular region at (178, 32) spanning 57 by 75 pixels.
; PLAN: r0=178(x), r1=32(y), r2=57(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 32
LDI r2, 57
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
