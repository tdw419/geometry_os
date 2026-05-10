; DESCRIPTION: Creates a magenta rectangular region at (148, 62) spanning 51 by 40 pixels.
; PLAN: r0=148(x), r1=62(y), r2=51(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 62
LDI r2, 51
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
