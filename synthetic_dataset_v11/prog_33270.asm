; DESCRIPTION: Creates a magenta rectangular region at (165, 98) spanning 62 by 84 pixels.
; PLAN: r0=165(x), r1=98(y), r2=62(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 98
LDI r2, 62
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
