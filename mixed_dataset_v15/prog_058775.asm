; DESCRIPTION: Places a magenta 54x119 rectangle at position (451, 136).
; PLAN: r0=451(x), r1=136(y), r2=54(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 136
LDI r2, 54
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
