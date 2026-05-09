; DESCRIPTION: Places a magenta 54x108 rectangle at position (89, 2).
; PLAN: r0=89(x), r1=2(y), r2=54(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 2
LDI r2, 54
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
