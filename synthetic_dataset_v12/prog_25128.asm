; DESCRIPTION: Creates a magenta rectangular region at (74, 63) spanning 13 by 59 pixels.
; PLAN: r0=74(x), r1=63(y), r2=13(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 63
LDI r2, 13
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
