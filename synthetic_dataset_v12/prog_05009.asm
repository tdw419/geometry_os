; DESCRIPTION: Places a green 22x89 rectangle at position (94, 162).
; PLAN: r0=94(x), r1=162(y), r2=22(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 162
LDI r2, 22
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
