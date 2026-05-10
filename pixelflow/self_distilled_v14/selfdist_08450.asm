; DESCRIPTION: Places a yellow 90x14 box at position (216, 1).
; PLAN: r0=216(x), r1=1(y), r2=90(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 1
LDI r2, 90
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
