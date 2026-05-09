; DESCRIPTION: Places a green 21x89 rectangle at position (139, 162).
; PLAN: r0=139(x), r1=162(y), r2=21(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 162
LDI r2, 21
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
