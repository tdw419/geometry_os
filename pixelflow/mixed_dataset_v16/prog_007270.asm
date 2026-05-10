; DESCRIPTION: Places a green 80x118 box at position (191, 66).
; PLAN: r0=191(x), r1=66(y), r2=80(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 66
LDI r2, 80
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
