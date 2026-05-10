; DESCRIPTION: Places a blue 115x77 rectangle at position (6, 80).
; PLAN: r0=6(x), r1=80(y), r2=115(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 80
LDI r2, 115
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
