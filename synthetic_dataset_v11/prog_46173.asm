; DESCRIPTION: Creates a magenta rectangular region at (9, 127) spanning 32 by 52 pixels.
; PLAN: r0=9(x), r1=127(y), r2=32(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 127
LDI r2, 32
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
