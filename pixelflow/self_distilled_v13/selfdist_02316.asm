; DESCRIPTION: Places a yellow 19x101 box at position (75, 32).
; PLAN: r0=75(x), r1=32(y), r2=19(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 32
LDI r2, 19
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
