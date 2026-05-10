; DESCRIPTION: Places a blue 20x89 rectangle at position (98, 114).
; PLAN: r0=98(x), r1=114(y), r2=20(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 114
LDI r2, 20
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
