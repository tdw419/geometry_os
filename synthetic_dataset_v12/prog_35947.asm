; DESCRIPTION: Creates a magenta rectangular region at (262, 3) spanning 94 by 101 pixels.
; PLAN: r0=262(x), r1=3(y), r2=94(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 3
LDI r2, 94
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
