; DESCRIPTION: Creates a magenta rectangular region at (258, 8) spanning 94 by 89 pixels.
; PLAN: r0=258(x), r1=8(y), r2=94(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 8
LDI r2, 94
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
