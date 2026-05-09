; DESCRIPTION: Places a black 89x63 rectangle at position (106, 118).
; PLAN: r0=106(x), r1=118(y), r2=89(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 118
LDI r2, 89
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
