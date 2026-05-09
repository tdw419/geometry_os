; DESCRIPTION: Creates a magenta rectangular region at (345, 101) spanning 24 by 120 pixels.
; PLAN: r0=345(x), r1=101(y), r2=24(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 101
LDI r2, 24
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
