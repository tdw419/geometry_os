; DESCRIPTION: Creates a magenta rectangular region at (29, 63) spanning 83 by 74 pixels.
; PLAN: r0=29(x), r1=63(y), r2=83(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 63
LDI r2, 83
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
