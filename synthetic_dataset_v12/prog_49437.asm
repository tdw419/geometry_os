; DESCRIPTION: Creates a magenta rectangular region at (377, 192) spanning 107 by 63 pixels.
; PLAN: r0=377(x), r1=192(y), r2=107(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 192
LDI r2, 107
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
