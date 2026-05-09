; DESCRIPTION: Places a green 76x44 rectangle at position (343, 110).
; PLAN: r0=343(x), r1=110(y), r2=76(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 110
LDI r2, 76
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
