; DESCRIPTION: Places a orange 115x118 rectangle at position (326, 51).
; PLAN: r0=326(x), r1=51(y), r2=115(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 51
LDI r2, 115
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
