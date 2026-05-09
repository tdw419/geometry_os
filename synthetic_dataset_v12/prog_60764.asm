; DESCRIPTION: Places a yellow 72x118 rectangle at position (432, 23).
; PLAN: r0=432(x), r1=23(y), r2=72(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 23
LDI r2, 72
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
