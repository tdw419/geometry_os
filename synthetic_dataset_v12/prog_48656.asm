; DESCRIPTION: Creates a magenta rectangular region at (142, 26) spanning 88 by 50 pixels.
; PLAN: r0=142(x), r1=26(y), r2=88(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 26
LDI r2, 88
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
