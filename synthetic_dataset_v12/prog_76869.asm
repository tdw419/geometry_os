; DESCRIPTION: Places a magenta 89x118 rectangle at position (98, 7).
; PLAN: r0=98(x), r1=7(y), r2=89(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 7
LDI r2, 89
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
