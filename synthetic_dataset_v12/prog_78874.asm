; DESCRIPTION: Creates a magenta rectangular region at (447, 157) spanning 32 by 70 pixels.
; PLAN: r0=447(x), r1=157(y), r2=32(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 157
LDI r2, 32
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
