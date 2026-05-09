; DESCRIPTION: Places a blue 108x89 rectangle at position (52, 3).
; PLAN: r0=52(x), r1=3(y), r2=108(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 3
LDI r2, 108
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
