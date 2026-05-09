; DESCRIPTION: Places a green 11x89 rectangle at position (84, 79).
; PLAN: r0=84(x), r1=79(y), r2=11(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 79
LDI r2, 11
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
