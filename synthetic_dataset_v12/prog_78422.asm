; DESCRIPTION: Places a green 76x18 rectangle at position (311, 179).
; PLAN: r0=311(x), r1=179(y), r2=76(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 179
LDI r2, 76
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
