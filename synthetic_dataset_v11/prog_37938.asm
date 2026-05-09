; DESCRIPTION: Creates a magenta rectangular region at (52, 142) spanning 90 by 88 pixels.
; PLAN: r0=52(x), r1=142(y), r2=90(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 142
LDI r2, 90
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
