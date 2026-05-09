; DESCRIPTION: Creates a magenta rectangular region at (132, 137) spanning 67 by 29 pixels.
; PLAN: r0=132(x), r1=137(y), r2=67(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 137
LDI r2, 67
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
