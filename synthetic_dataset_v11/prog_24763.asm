; DESCRIPTION: Creates a magenta rectangular region at (184, 44) spanning 36 by 13 pixels.
; PLAN: r0=184(x), r1=44(y), r2=36(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 44
LDI r2, 36
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
