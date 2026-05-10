; DESCRIPTION: Places a blue 13x89 rectangle at position (8, 25).
; PLAN: r0=8(x), r1=25(y), r2=13(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 25
LDI r2, 13
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
