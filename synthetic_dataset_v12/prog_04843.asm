; DESCRIPTION: Creates a magenta rectangular region at (0, 163) spanning 64 by 52 pixels.
; PLAN: r0=0(x), r1=163(y), r2=64(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 163
LDI r2, 64
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
