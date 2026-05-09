; DESCRIPTION: Creates a magenta rectangular region at (10, 177) spanning 64 by 74 pixels.
; PLAN: r0=10(x), r1=177(y), r2=64(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 177
LDI r2, 64
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
