; DESCRIPTION: Places a black 89x118 rectangle at position (30, 125).
; PLAN: r0=30(x), r1=125(y), r2=89(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 125
LDI r2, 89
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
