; DESCRIPTION: Places a yellow 80x101 rectangle at position (94, 15).
; PLAN: r0=94(x), r1=15(y), r2=80(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 15
LDI r2, 80
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
