; DESCRIPTION: Places a blue 52x89 rectangle at position (345, 120).
; PLAN: r0=345(x), r1=120(y), r2=52(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 120
LDI r2, 52
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
