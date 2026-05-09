; DESCRIPTION: Creates a magenta rectangular region at (179, 64) spanning 54 by 43 pixels.
; PLAN: r0=179(x), r1=64(y), r2=54(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 64
LDI r2, 54
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
