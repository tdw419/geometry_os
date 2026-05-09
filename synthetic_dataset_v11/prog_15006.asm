; DESCRIPTION: Places a green 89x79 rectangle at position (141, 72).
; PLAN: r0=141(x), r1=72(y), r2=89(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 72
LDI r2, 89
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
