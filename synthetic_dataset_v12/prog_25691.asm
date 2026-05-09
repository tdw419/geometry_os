; DESCRIPTION: Places a yellow 79x89 rectangle at position (311, 142).
; PLAN: r0=311(x), r1=142(y), r2=79(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 142
LDI r2, 79
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
