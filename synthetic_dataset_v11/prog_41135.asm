; DESCRIPTION: Places a magenta 118x40 rectangle at position (44, 110).
; PLAN: r0=44(x), r1=110(y), r2=118(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 110
LDI r2, 118
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
