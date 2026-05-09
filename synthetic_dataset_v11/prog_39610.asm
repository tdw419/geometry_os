; DESCRIPTION: Creates a magenta rectangular region at (182, 99) spanning 63 by 82 pixels.
; PLAN: r0=182(x), r1=99(y), r2=63(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 99
LDI r2, 63
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
