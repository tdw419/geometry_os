; DESCRIPTION: Creates a magenta rectangular region at (176, 148) spanning 61 by 23 pixels.
; PLAN: r0=176(x), r1=148(y), r2=61(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 148
LDI r2, 61
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
