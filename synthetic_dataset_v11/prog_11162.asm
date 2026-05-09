; DESCRIPTION: Creates a magenta rectangular region at (89, 94) spanning 74 by 82 pixels.
; PLAN: r0=89(x), r1=94(y), r2=74(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 94
LDI r2, 74
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
