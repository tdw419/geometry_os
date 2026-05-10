; DESCRIPTION: Places a blue 22x74 box at position (2, 26).
; PLAN: r0=2(x), r1=26(y), r2=22(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 26
LDI r2, 22
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
