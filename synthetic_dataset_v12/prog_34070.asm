; DESCRIPTION: Places a green 21x118 rectangle at position (201, 100).
; PLAN: r0=201(x), r1=100(y), r2=21(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 100
LDI r2, 21
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
