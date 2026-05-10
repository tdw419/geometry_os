; DESCRIPTION: Renders a magenta rectangular region spanning 117 by 94 at (62, 45).
; PLAN: r0=62(x), r1=45(y), r2=117(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 45
LDI r2, 117
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
