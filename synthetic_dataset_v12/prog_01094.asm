; DESCRIPTION: Creates a magenta rectangular region at (139, 49) spanning 64 by 86 pixels.
; PLAN: r0=139(x), r1=49(y), r2=64(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 49
LDI r2, 64
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
