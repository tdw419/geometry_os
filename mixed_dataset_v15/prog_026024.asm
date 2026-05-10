; DESCRIPTION: Places a green 74x100 rectangle at position (139, 89).
; PLAN: r0=139(x), r1=89(y), r2=74(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 89
LDI r2, 74
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
