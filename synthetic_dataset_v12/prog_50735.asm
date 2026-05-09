; DESCRIPTION: Places a yellow 75x81 rectangle at position (131, 89).
; PLAN: r0=131(x), r1=89(y), r2=75(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 89
LDI r2, 75
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
