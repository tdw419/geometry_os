; DESCRIPTION: Creates a magenta rectangular region at (220, 219) spanning 29 by 26 pixels.
; PLAN: r0=220(x), r1=219(y), r2=29(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 219
LDI r2, 29
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
