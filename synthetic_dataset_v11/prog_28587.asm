; DESCRIPTION: Places a blue 118x13 rectangle at position (112, 106).
; PLAN: r0=112(x), r1=106(y), r2=118(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 106
LDI r2, 118
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
