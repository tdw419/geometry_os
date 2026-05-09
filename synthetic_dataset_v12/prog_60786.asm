; DESCRIPTION: Creates a magenta rectangular region at (63, 88) spanning 77 by 82 pixels.
; PLAN: r0=63(x), r1=88(y), r2=77(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 88
LDI r2, 77
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
