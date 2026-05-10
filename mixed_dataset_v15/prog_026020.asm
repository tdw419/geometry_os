; DESCRIPTION: Places a magenta 84x22 rectangle at position (89, 80).
; PLAN: r0=89(x), r1=80(y), r2=84(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 80
LDI r2, 84
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
