; DESCRIPTION: Renders a magenta rectangular region spanning 94 by 58 at (218, 35).
; PLAN: r0=218(x), r1=35(y), r2=94(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 35
LDI r2, 94
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
