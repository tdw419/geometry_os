; DESCRIPTION: Places a yellow 63x118 rectangle at position (2, 75).
; PLAN: r0=2(x), r1=75(y), r2=63(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 75
LDI r2, 63
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
