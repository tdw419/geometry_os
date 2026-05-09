; DESCRIPTION: Creates a magenta rectangular region at (103, 167) spanning 61 by 88 pixels.
; PLAN: r0=103(x), r1=167(y), r2=61(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 167
LDI r2, 61
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
