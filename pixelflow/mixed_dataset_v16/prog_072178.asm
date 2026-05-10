; DESCRIPTION: Places a blue 89x59 box at position (10, 70).
; PLAN: r0=10(x), r1=70(y), r2=89(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 70
LDI r2, 89
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
