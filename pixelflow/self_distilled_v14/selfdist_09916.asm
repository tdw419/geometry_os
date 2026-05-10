; DESCRIPTION: Places a yellow 101x12 box at position (6, 101).
; PLAN: r0=6(x), r1=101(y), r2=101(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 101
LDI r2, 101
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
