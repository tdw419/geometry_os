; DESCRIPTION: Places a yellow 87x13 box at position (323, 151).
; PLAN: r0=323(x), r1=151(y), r2=87(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 151
LDI r2, 87
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
