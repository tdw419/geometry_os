; DESCRIPTION: Places a magenta 89x58 rectangle at position (110, 0).
; PLAN: r0=110(x), r1=0(y), r2=89(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 0
LDI r2, 89
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
