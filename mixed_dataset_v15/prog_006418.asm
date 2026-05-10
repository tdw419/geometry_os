; DESCRIPTION: Creates a magenta rectangular region at (26, 78) spanning 111 by 94 pixels.
; PLAN: r0=26(x), r1=78(y), r2=111(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 78
LDI r2, 111
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
