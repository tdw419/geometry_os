; DESCRIPTION: Places a red 21x101 rectangle at position (427, 105).
; PLAN: r0=427(x), r1=105(y), r2=21(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 105
LDI r2, 21
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
