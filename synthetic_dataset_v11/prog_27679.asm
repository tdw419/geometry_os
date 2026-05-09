; DESCRIPTION: Places a magenta 37x99 rectangle at position (89, 22).
; PLAN: r0=89(x), r1=22(y), r2=37(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 22
LDI r2, 37
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
