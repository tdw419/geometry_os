; DESCRIPTION: Creates a magenta rectangular region at (101, 178) spanning 13 by 29 pixels.
; PLAN: r0=101(x), r1=178(y), r2=13(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 178
LDI r2, 13
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
