; DESCRIPTION: Creates a magenta rectangular region at (63, 150) spanning 35 by 57 pixels.
; PLAN: r0=63(x), r1=150(y), r2=35(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 150
LDI r2, 35
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
