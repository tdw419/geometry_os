; DESCRIPTION: Creates a magenta rectangular region at (23, 50) spanning 81 by 74 pixels.
; PLAN: r0=23(x), r1=50(y), r2=81(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 50
LDI r2, 81
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
