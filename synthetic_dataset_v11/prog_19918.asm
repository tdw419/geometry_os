; DESCRIPTION: Creates a magenta rectangular region at (54, 101) spanning 117 by 61 pixels.
; PLAN: r0=54(x), r1=101(y), r2=117(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 101
LDI r2, 117
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
