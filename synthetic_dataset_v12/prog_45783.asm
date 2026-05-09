; DESCRIPTION: Places a magenta 44x26 rectangle at position (89, 94).
; PLAN: r0=89(x), r1=94(y), r2=44(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 94
LDI r2, 44
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
