; DESCRIPTION: Creates a magenta rectangular region at (283, 42) spanning 108 by 63 pixels.
; PLAN: r0=283(x), r1=42(y), r2=108(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 42
LDI r2, 108
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
